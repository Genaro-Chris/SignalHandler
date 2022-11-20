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
        var cont: AsyncStream<Element>.Continuation!
        projectedValue = AsyncStream { continuation in 
            cont = continuation
        }
        continuation = cont
    }

    fileprivate func appendToStream(newValue: Element) {
        continuation.yield(newValue)
    }
}
