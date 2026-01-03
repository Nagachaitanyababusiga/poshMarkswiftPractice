//argument labels
func callme(firstname name1: String,secondname name2: String){
    print("firstname is \(name1), second name is \(name2)")
}

callme(firstname: "naga",secondname: "babu")

func functionnolabels(_ name: String,_ val: String){
    print(name, terminator: " ")
    print(val)
}

functionnolabels("a","b")

//function with Default values
func callname(_ name: String,withemoji emoji: String = ""){
    print(name+" "+emoji)
}

callname("babu")
callname("babu",withemoji:"😊")

//variadic parameters
func sumAll(_ vals: Int...)->Int{
    return vals.reduce(0,+);
}

print(sumAll(1,2,3,4,5))

//returning multiple values
func minmax(_ arr: [Int])->(min: Int,max: Int)?{
    guard let first = arr.first else{ return nil};
    var min=first;
    var max=first
    for num in arr{
        if(min>num){
            min=num;
        }
        if(max<num){
            max=num;
        }
    }
    return (min: min,max: max)
}

if let ans = minmax([1,2,3,4,5]){
    print(ans)
}else{
    print("The function returned nil")
}

//Closures

//syntax
let add = { (_ a: Int,_ b: Int) -> Int in 
    return a+b;
}

print(add(1,5))

//trailing closures
//If the last parameter is a closure, you can write it outside parentheses.

//example1
func action(_ a: Int,_ b:Int){
    print("a: \(a), b: \(b)");
}

func printer(_ a:Int,_ b:Int,_ action: (Int,Int)-> Void){
    action(a,b)
}

// printer(5,3,action)
//example2
func action2(_ a:Int,_ b:Int,_ completion: (Int,Int)->Void){
    completion(a,b)
}

//calling trailing closure
action2(5,3){ x,y in 
    print("sum of x: \(x), y: \(y) is x+y: \(x+y)");
}

//Capture list
class MyClass{
    var completion: (()-> Void)?;
    init() {
        completion={ [weak self] in
            self?.doSomething();
            //self.doSomething()
        }
    }
    func doSomething() -> Void{
        print("Hello do something is called");
    }
    deinit {
        print("The class is deallocated")
    }
}

var mc1: MyClass? = MyClass()
if let mc1function = mc1?.completion{
    mc1function()
}else{
    print("optional is not unwrapped")
}
mc1=nil

//non escaping closures
func nec(_ closure: ()->Void){
    closure()
}

nec{
    print("Hello world in non escping closure");
}

//escaping closures
func ec(_ closure: @escaping ()->Void){
    closure()
}

ec{
    print("This is an escaping closure, if some activies takes time, like api call or some other things we use this syntax")
}

//autoclosures
func ec(_ expression: @autoclosure ()->Bool){
    if(expression()){
        print("converts an expression to closure")
    }
}

ec(1<2)