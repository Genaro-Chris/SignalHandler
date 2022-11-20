import Foundation
extension SignalHandler: Equatable {
public static func == (lhs: SignalHandler, rhs: SignalHandler) -> Bool {
        lhs.signals == rhs.signals
    }
}


internal func notifer(value: Int32) {
    guard let signal = Signals(rawValue: value) else {
        return
    }
    SignalHandler.source = signal
}

