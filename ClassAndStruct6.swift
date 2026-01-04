struct Mystruct {

    var name: String;
    var age: Int;

    mutating func changeName(_ name:String)->Void{
        self.name=name
    }

    func printer(){
        print("\(name) \(age)")
    }

}


//class object
class Parent{
    private var age: Int // encapsulation
    private var name: String
    init(_ name: String,_ age: Int) {
        self.age=age
        self.name=name
    }
    func printer(){
        print("\(name) \(age)")
    }
}

//inheritance
class MyChild: Parent{
    var sound: String
    init(_ name: String,_ age: Int,_ sound: String) {
        self.sound=sound
        super.init(name,age)
    }
    override func printer(){ // poly morphism
        print("\(name) \(age) \(sound)")
    }
    func setSound(_ sound: String){
        self.sound=sound
    }
}

var st: Mystruct = Mystruct(name: "Babu",age: 20)
st.printer()
st.changeName("Ram")
st.printer()

var c: MyChild = MyChild("Babu",2,"Bey Be, Mama")
c.printer()
c.setSound("haha")
c.printer()

// ==== is same for classes but different for structs


//abstraction

protocol Shape {
    func area() -> Double
}

struct Circle: Shape {
    var radius: Double
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

struct Rectangle: Shape {
    var width: Double
    var height: Double
    func area() -> Double {
        return width * height
    }
}

// Usage
let shapes: [Shape] = [Circle(radius: 5), Rectangle(width: 4, height: 6)]
for shape in shapes {
    print(shape.area())  // Works without knowing exact type
}
