//Generic Functions
func swapValues<T>(_ a: inout T,_ b: inout T){
    let temp: T = a;
    a=b;
    b=temp;
}

var a=5
var b=10
swapValues(&a,&b)
print(a)
print(b)

//2. Generic types
// Generic Stack
struct Stack<Element> {
    private var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack.pop()!)  // 2

var stringStack = Stack<String>()
stringStack.push("Swift")
stringStack.push("Generics")
print(stringStack.pop()!)  // Generics


//3. Using Constraints
// Generic function with constraint
//here equitable refers to a protocol where we can use == for comparing.
func findIndex<T: Equatable>(of value: T, in array: [T]) -> Int? {
    for (index, element) in array.enumerated() {
        if element == value {
            return index
        }
    }
    return nil
}

let numbers = [10, 20, 30]
print(findIndex(of: 20, in: numbers)!)  // 1



//4. Prototcol+ Generics //POP
protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    func getAll() -> [Item]
}

// Generic type conforming to protocol
struct Box<T>: Container {
    typealias Item = T
    private var items: [T] = []
    
    mutating func add(_ item: T) {
        items.append(item)
    }
    
    func getAll() -> [T] {
        return items
    }
}

var box = Box<String>()
box.add("Swift")
box.add("Generics")
print(box.getAll())  // ["Swift", "Generics"]
