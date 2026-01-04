
//designated 
//convience
class A{
    var a: Int;
    var b: Int;
    init(_ a: Int,_ b: Int) {
        self.a=a;
        self.b=b;
    }
    convenience init(_ a:Int) {
        self.init(a,0);
    }
    func printer(){
        print("\(a) \(b)")
    }
}

var obj1=A(1,2)
obj1.printer()
var obj2=A(1)
obj2.printer()


//failable 
class B{
    var a: String;
    init?(_ a: String) {
        if(a.isEmpty){
            return nil
        }
        self.a=a
    }
    func printer(){
        print("\(a)")
    }
}

var obj3: B?=B("");
if let val=obj3{
    val.printer()
}else{
    print("Nil value found")
}

//Struct uses memberwise initializers by default

struct Point {
    var x: Int
    var y: Int
}

let p = Point(x: 10, y: 20)   // memberwise initializer



//ARC

class Person {
    var name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    var unit: String
    var tenant: Person?
    init(unit: String) { self.unit = unit }
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person? = Person(name: "John")
var unit4A: Apartment? = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil
// Neither deinit runs → memory leak (strong cycle)


//Weak
class Apartment {
    var unit: String
    weak var tenant: Person?   // weak reference
    init(unit: String) { self.unit = unit }
}

//Unowned
class CreditCard {
    let number: Int
    unowned let owner: Person   // unowned reference
    init(number: Int, owner: Person) {
        self.number = number
        self.owner = owner
    }
}

//in closures we use [weak self]