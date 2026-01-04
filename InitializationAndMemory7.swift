
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
