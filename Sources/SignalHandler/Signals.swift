import Foundation

/// *Nix signals
///
/// Includes mostly POSIX, a few ANSI, BSD, System V, and Sun signals that a program can catch and handle by its self,
/// such as  Ctrl + C or ^C, Ctrl + Z or ^Z signals.
/// A few signals were intentionally ignored such as `Kill` and `Stop` signals because they can't be caught
public enum Signals: Int32, CaseIterable, Sendable, Equatable {
    /// Hang-up (POSIX)
    case SIGHUP = 1
    /// Ctrl + C or Terminal Interrupt (ANSI)
    case SIGINT
    /// Ctrl + Z or Terminal quit (POSIX)
    case SIGQUIT
    /// Illegal instruction (ANSI)
    case SIGILL
    /// Trace trap (POSIX)
    case SIGTRAP
    /// IOT trap (4.2 BSD)
    case SIGIOT
    /// BUS error (4.2 BSD)
    case SIGBUS
    /// Floating point exception (ANSI)
    case SIGFPE
    ///Avoid handling this case, only kernel can handle it
    //case SIGKILL
    /// User-defined signal 1 (POSIX)
    case SIGUSR1 = 10
    /// Invalid memory segment access (ANSI)
    case SIGSEGV
    /// User-defined signal 2 (POSIX)
    case SIGUSR2
    /// Broken pipe (POSIX)
    case SIGPIPE
    /// Alarm clock (POSIX)
    case SIGALRM
    /// Termination (ANSI)
    case SIGTERM
    /// Stack Fault
    case SIGSTKFLT
    /// Child process exited or stopped (POSIX)
    case SIGCHLD
    /// Resume execution if stopped (POSIX)
    case SIGCONT
    /// Ctrl + \  or Terminal stop signal (POSIX)
    case SIGTSTP = 20
    /// Background process trying to read, from TTY (POSIX)
    case SIGTTIN
    /// Background process trying to write, to TTY (POSIX)
    case SIGTTOU
    /// Urgent condition on socket (4.2 BSD)
    case SIGURG
    /// CPU limit exceeded (4.2 BSD)
    case SIGXCPU
    /// File size exceeded (4.2 BSD)
    case SIGXFSZ
    /// Virtual alarm clock (4.2 BSD)
    case SIGVTALRM
    /// Profiling alarm clock (4.2 BSD)
    case SIGPROF
    /// Window size change (4.2 BSD, Sun)
    case SIGWINCH
    /// I/O now possible (4.2 BSD)
    case SIGIO
    /// Power failure restart (System V)
    case SIGPWR
    ///Not defined on any architecture
    case SIGSYS

    case SIGSTKSZ = 8192
}

extension Signals: CustomStringConvertible {
    public var description: String {
        let description: String
        switch self {

            case .SIGHUP: description = "Hang-up (POSIX)"

            case .SIGINT: description = "Ctrl + C or Terminal Interrupt (ANSI)"

            case .SIGQUIT: description = "Ctrl + Z or Terminal quit (POSIX)"

            case .SIGILL: description = "Illegal instruction (ANSI)"

            case .SIGTRAP: description = "Trace trap (POSIX)"

            case .SIGIOT: description = "IOT trap (4.2 BSD)"

            case .SIGBUS: description = "BUS error (4.2 BSD)"

            case .SIGFPE: description = "Floating point exception (ANSI)"

            case .SIGUSR1: description = "User-defined signal 1 (POSIX)"

            case .SIGSEGV: description = "Invalid memory segment access (ANSI)"

            case .SIGUSR2: description = "User-defined signal 2 (POSIX)"

            case .SIGPIPE: description = "Broken pipe (POSIX)"

            case .SIGALRM: description = "Alarm clock (POSIX)"

            case .SIGTERM: description = "Termination (ANSI)"

            case .SIGSTKFLT: description = "Stack Fault"

            case .SIGCHLD: description = "Child process exited or stopped (POSIX)"

            case .SIGCONT: description = "Resume execution if stopped (POSIX)"

            case .SIGTSTP: description = #"Ctrl + \ or Terminal stop signal (POSIX"#

            case .SIGTTIN: description = "Background process trying to read, from TTY (POSIX)"

            case .SIGTTOU: description = "Background process trying to write, to TTY (POSIX)"

            case .SIGURG: description = "Urgent condition on socket (4.2 BSD)"

            case .SIGXCPU: description = "CPU limit exceeded (4.2 BSD)"

            case .SIGXFSZ: description = "File size exceeded (4.2 BSD)"

            case .SIGVTALRM: description = "Virtual alarm clock (4.2 BSD)"

            case .SIGPROF: description = "Profiling alarm clock (4.2 BSD"

            case .SIGWINCH: description = "Window size change (4.2 BSD, Sun)"

            case .SIGIO: description = "I/O now possible (4.2 BSD)"

            case .SIGPWR: description = "Power failure restart (System V)"

            case .SIGSYS: description = "Not defined on any architecture"

            case .SIGSTKSZ: description = "SIGSTKSZ"

        }
        return description
    }

}
