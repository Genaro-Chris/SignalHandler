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
        (projectedValue, continuation) = AsyncStream.makeStream()
    }

    fileprivate func appendToStream(newValue: Element) {
        continuation.yield(newValue)
    }
}
