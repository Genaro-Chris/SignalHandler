@propertyWrapper
struct SourceSequence<Element> {
    var wrappedValue: Element {
        get { fatalError("Unimplemented!") }
        nonmutating set {
            appendToStream(newValue: newValue)
        }
    }

    let projectedValue: AsyncStream<Element>
    private let continuation: AsyncStream<Element>.Continuation

    init() {
        #if compiler(>=5.9)
            (projectedValue, continuation) = AsyncStream.makeStream()
        #else
            (projectedValue, continuation) = {
                var continuation: AsyncStream<Element>.Continuation!
                let stream = AsyncStream { cont in
                    continuation = cont
                }
                return (stream, continuation)
            }()
        #endif

    }

    fileprivate func appendToStream(newValue: Element) {
        continuation.yield(newValue)
    }
}
