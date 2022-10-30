import Foundation
import AsyncAlgorithms
extension SignalHandler: Equatable {
public static func == (lhs: SignalHandler, rhs: SignalHandler) -> Bool {
        lhs.signals == rhs.signals
    }
}

infix operator <- 

extension AsyncChannel {
    /// Sends value to an AsyncChannel asynchronously
    public static func <-(channel: AsyncChannel, element: Element) async {
        await channel.send(element)
    }

}

internal func notifer(value: Int32) {
    Task(priority: .userInitiated) {
        let signal = Signals(rawValue: value)!
        await SignalHandler.channel <- signal
    }
}
