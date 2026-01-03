let constant: String = "constant value"
// constant = "hello change" // value cannot be changed as it is a constant
print(constant)
var val: String = "constant value"
val="change" // value can be easily re assigned
print(val)


//classes

class Dog{
    var name: String;
    init(_ name: String){
        self.name=name
    }
    func sound() -> Void{
        print("Bow Bow")
    }
}

class Cat{
    var name: String;
    init(_ name: String){
        self.name=name
    }
    func sound() -> Void{
        print("Meow")
    }
}

//type inference
let a="String"
print(a)

let a1: Int = 5;
print(a1);
let a2: Double = 5.5;
print(a2)
let a3: Float = 5.2;
print(a3)
let a4: String = "string"
print(a4)
let a5: Character = "A";
print(a5)
let a6: Bool = true
print(a6)
let a7: Dog = Dog("Timpy")
print(a7)
a7.sound()
let a8: AnyObject = Dog("Timpy")
if let dog: Dog = a8 as? Dog {
    dog.sound()
}

func a9() -> Never{
    while(true){
        print("This function never ends")
    }
}

// a9()

//type of
print(type(of: a3))

// Any, as? , as!

//upcaasting
let stringhelp: String = "String as any";
let help: Any = stringhelp
print(help)

//downcasting
let stringas: Any = "string is downcasted"
if let usingas = stringas as? String{
    print(usingas)
}else{
    print("the type is not string")
}

//downcasting
let finaloutput = stringas as! String
print(finaloutput)

let name: String = "nagachaitanyababu"
let age: Int = 20

print("My name is : \(name) and age is \(age) \n")