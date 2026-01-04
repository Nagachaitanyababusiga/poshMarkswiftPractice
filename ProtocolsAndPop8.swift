
//Method requirements

protocol Flyable {
    func fly() -> Void;
}

struct Bird: Flyable {
    func fly(){
        print("Bird is flying")
    }    
}

var b: Flyable=Bird()
b.fly()


// Properties requriements
protocol Vehicle {
    var speed: Int {set get}
    var brand: String {get}
}

struct Car: Vehicle{
    var speed: Int;
    var brand: String;
}

//associated types
protocol Container {
    associatedtype Item
    func add(_ item: Item)
    func getAll() -> [Item]
}

struct IntContainer: Container {
    typealias Item = Int
    private var items: [Int] = []
    
    func add(_ item: Int) { /* ... */ }
    func getAll() -> [Int] { items }
}

// protocol extensions
// default iimplementations of protocols

protocol Helper {
    func help()->Void;
}

extension Helper {
    func help(){
        print("helped")
    }
}

struct Structhelp: Helper{

}

var sh: Structhelp = Structhelp()
sh.help()



/*
2. Why Swift Prefers Protocols Over Inheritance
Structs + Protocols → safer, value types, no shared mutable state.

Protocols → multiple types can conform (no single inheritance limitation).

Flexibility → protocols + extensions allow mixing behaviors without deep class hierarchies.

Composition > Inheritance → Swift encourages building small, reusable behaviors instead of rigid hierarchies.

Performance → value types (structs) with protocols are often faster and safer than heap-allocated classes.

*/