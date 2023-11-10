import Foundation

/**
Handler for most handleable *nix signals

It catches the signal asynchronously on the fly while executing the callback supplied to it.
It provides a way to clean up and exit if a signal registered is being caught

It should always be the first code and its encouraged to run in parallel with `async let` syntax in order to enable it catch signals as soon as your code start executing

Always remember to call ``start()`` otherwise the registered signals won't be caught

Example of its usage
```swift
    let exitHandler = SignalHandler(signals: .SIGINT, .SIQUIT) { _ in
        print("Closing this program")
        // Code to clean up resources used
    }
    async let _ = exitHandler.start()
```
Or
```swift
    Task {
        let exithandler = SignalHandler(signals: .SIGINT, .SIQUIT) { _ in
            print("Closing this program")
            // Code to clean up resources used
        }
        await exithandler.start()
    }
```
*/
public actor SignalHandler {

    @SourceSequence<Signals>
    static internal var source: Signals

    /// A simple singleton for the ``SignalHandler`` type
    ///
    /// Provides a default handler for most common signals such as:
    ///     `Ctrl+C or ^C`,
    ///     `Ctrl+Z or ^Z`,
    ///     `Ctrl+\ or ^\`,
    /// and if any of the above is being caught, prints `Quitting...` then exits with exit code 1
    public static let `default` = SignalHandler(signals: .SIGINT, .SIGQUIT, .SIGTSTP) { _ in
        print("\nQuitting... \r\r")
        exit(1)
    }

    /// Signals registered to be handled
    ///
    /// Stores all the signals that this instance should handle as an array of ``Signals``
    public let signals: [Signals]

    /// Instantiates this type
    ///
    /// Given the correct arguments, initializes this type whose instance is ready to catch all registered signals and executes the completion handler whenever any one of the signals are caught
    ///
    /// - Parameters:
    ///   - signals: varidaic number of signals to register
    ///   - handler: a completion handler to be called if any signal is being caught
    public init(signals: Signals..., handler: @escaping ((Int32) async -> Void)) {
        self.signals = signals
        self.handler = handler
    }

    /// Instantiates this type
    ///
    /// Given the correct arguments, initializes this type whose instnce is ready to catch all registered signals and executes the completion handler whenever any one of the signals are caught
    ///
    /// - Parameters:
    ///   - signals: array of signals to register
    ///   - handler: a completion handler to be called if any signal is being caught
    public init(signals: [Signals], handler: @escaping ((Int32) async -> Void)) {
        self.signals = signals
        self.handler = handler
    }

    /// Callback to run if any registered signal is caught
    ///
    /// This callback can't be any function associated with a type such as instance or type methods, just a plain old closure
    ///
    /// Code example
    /// ```swift
    ///    let callback: (Int32) -> ()
    ///     callback = { value in
    ///         print("This is a callback handler")
    ///     }
    /// ```
    public let handler: ((Int32) async -> Void)

    nonisolated
        private func notify() async
    {
        for _ in 0 ... ProcessInfo.processInfo.activeProcessorCount {
            async let _ = withTaskGroup(of: Void.self) { [self] in
                for i in self.signals {
                    $0.addTask {
                        let _ = signal(i.rawValue, notifer(value:))
                    }
                }
            }
        }

        for signals in self.signals {
            Task.detached(priority: .userInitiated) {
                let _ = signal(signals.rawValue, notifer(value:))
            }
        }
    }

    /// Starts handling ``signals`` registered asynchronously as they being caught
    ///
    /// This instance method must called if this type was instantiated otherwise ``start(with:completion:)`` or ``start(with:handler:)`` method can be called instead
    public func start() async {
        Task(priority: .high) { await self.notify() }
        await withDiscardingTaskGroup { group in
            for await sign in Self.$source {
                group.addTask { [weak self] in
                    guard let self else {
                        return
                    }
                    await handler(sign.rawValue)
                }

            }
        }

    }

    /// Start handling signals
    ///
    /// - Parameters:
    ///   - signals: Array of signals to register
    ///   - completion: callback to execute when the signals are being caught
    ///
    /// Provides a quick way to start handle signals without the stress of instantiating the ``SignalHandler`` type and starting the handler by calling ``start()`` with just
    /// one line or few lines of codes
    ///
    ///  Code example of this usage:
    /// ```swift
    ///     async let signalHandler = SignalHandler.start(with: [.SIGINT, .SIGQUIT]) { _ in
    ///         // Code to clean up resources held
    ///         print("Closing socket")
    ///     }
    /// ```
    /// Or
    /// ```swift
    ///     Task {
    ///         await SignalHandler.start(with: [.SIGINT, .SIGQUIT]) { _ in
    ///             // Code to clean up resources held
    ///             print("Closing socket")
    ///         }
    ///     }
    /// ```
    public static nonisolated func start(
        with signals: [Signals], completion: @escaping ((Int32) -> Void)
    ) async {
        let signal = SignalHandler(signals: signals, handler: completion)
        await signal.start()
    }

    /// Start handling signals
    ///
    /// - Parameters:
    ///   - signals: Variadic signals to register
    ///   - handler: callback to execute when the signals are being caught
    ///
    /// Provides a quick way to start handle signals without the stress of instantiating the ``SignalHandler`` type and starting the handler by calling ``start()`` with just
    /// one line or few lines of codes
    ///
    ///  Code example of this method usage:
    /// ```swift
    ///     async let signalHandler = SignalHandler.start(with: .SIGINT, .SIGQUIT, .SIGTSTP) { _ in
    ///         // Code to clean up resources held
    ///         print("Quitting")
    ///     }
    /// ```
    /// Or
    /// ```swift
    ///     Task {
    ///         await SignalHandler.start(with: .SIGINT, .SIGQUIT) { _ in
    ///             // Code to clean up resources held
    ///             print("Closing socket")
    ///         }
    ///     }
    /// ```
    public static nonisolated func start(
        with signals: Signals..., handler: @escaping ((Int32) async -> Void)
    ) async {
        let signal = SignalHandler(signals: signals, handler: handler)
        await signal.start()
    }
}
