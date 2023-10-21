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
        switch self {

            case .SIGHUP: "Hang-up (POSIX)"

            case .SIGINT: "Ctrl + C or Terminal Interrupt (ANSI)"

            case .SIGQUIT: "Ctrl + Z or Terminal quit (POSIX)"

            case .SIGILL: "Illegal instruction (ANSI)"

            case .SIGTRAP: "Trace trap (POSIX)"

            case .SIGIOT: "IOT trap (4.2 BSD)"

            case .SIGBUS: "BUS error (4.2 BSD)"

            case .SIGFPE: "Floating point exception (ANSI)"

            case .SIGUSR1: "User-defined signal 1 (POSIX)"

            case .SIGSEGV: "Invalid memory segment access (ANSI)"

            case .SIGUSR2: "User-defined signal 2 (POSIX)"

            case .SIGPIPE: "Broken pipe (POSIX)"

            case .SIGALRM: "Alarm clock (POSIX)"

            case .SIGTERM: "Termination (ANSI)"

            case .SIGSTKFLT: "Stack Fault"

            case .SIGCHLD: "Child process exited or stopped (POSIX)"

            case .SIGCONT: "Resume execution if stopped (POSIX)"

            case .SIGTSTP: #"Ctrl + \ or Terminal stop signal (POSIX"#

            case .SIGTTIN: "Background process trying to read, from TTY (POSIX)"

            case .SIGTTOU: "Background process trying to write, to TTY (POSIX)"

            case .SIGURG: "Urgent condition on socket (4.2 BSD)"

            case .SIGXCPU: "CPU limit exceeded (4.2 BSD)"

            case .SIGXFSZ: "File size exceeded (4.2 BSD)"

            case .SIGVTALRM: "Virtual alarm clock (4.2 BSD)"

            case .SIGPROF: "Profiling alarm clock (4.2 BSD"

            case .SIGWINCH: "Window size change (4.2 BSD, Sun)"

            case .SIGIO: "I/O now possible (4.2 BSD)"

            case .SIGPWR: "Power failure restart (System V)"

            case .SIGSYS: "Not defined on any architecture"

            case .SIGSTKSZ: "SIGSTKSZ"

        }
    }

}
