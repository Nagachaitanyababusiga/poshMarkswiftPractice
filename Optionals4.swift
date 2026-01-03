/*
🧩 Why Optionals Exist
In Swift, every variable must have a value and a defined type.

But sometimes, a value may be absent (e.g., a failed network request, missing data, invalid conversion).

Instead of using unsafe “null pointers” (like in C/Java), Swift introduces Optionals to safely represent “value or no value.”

👉 An Optional is a type that can hold either:

A value of a specific type, or

nil (meaning “no value”).

swift
var name: String? = nil   // name may or may not have a value
🧩 nil
Represents the absence of a value.

Only Optionals can hold nil.

Non-optional variables must always have a valid value.

swift
var age: Int? = nil   // ✅ allowed
var score: Int = nil  // ❌ error: non-optional cannot be nil

*/

//optional binding
//using if let or guard let

func test(){
    let val: String? = "Babu";

    if let val1 = val{
        print("val1 is : \(val1)");
    }else{
        print("val1 value is not present")
    }

    guard let val2=val else{
        print("There is no val value")
        return
    }

    print("val2 is : \(val2)")
}

test()

class Pet{
    var name: String? = "Dog"
}

class Parent{
    var pet: Pet?
}

//optional chaining
var p: Parent=Parent()
if let name=p.pet?.name{
    print(name)
}else{
    print("This is a nil value")
}

p.pet=Pet()
if let name=p.pet?.name{
    print(name)
}else{
    print("This is a nil value")
}

//nil coalescing
p.pet=nil

print(p.pet?.name ?? "nil value")

//implicitly unwrapped optionals (!)

/*
var stringvalue: String!="value" //can lead to crashes
print(stringvalue)
*/