import Foundation

struct Stack<T> {
    private var values: [T] = []
    private var output: T?
    
    mutating func push(elem: T) {
        values.append(elem)
    }
    
    mutating func pop() -> T? {
        return values.removeLast()
    }
    
    func isEmpty() -> Bool {
        return values.isEmpty
    }
    
    func peek() -> T? {
        return values.last
    }
}

extension Stack {
    func show() {
        print(values)
    }
    mutating func clean() {
        values.removeAll()
    }
    
    func count() -> Int {
        return values.count
    }
}
