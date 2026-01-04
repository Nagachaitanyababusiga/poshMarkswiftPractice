//addding functionality

extension  Int {
    func squared() -> Int{
        return self*self
    }
}

let value: Int = 5;
print(value.squared())

//computed properties

extension Double{
    var km : Double{
        self/1000;
    }
    var cm : Double{
        self*100;
    }
}

let d : Double = 100;
print(d.km)
print(d.cm)

//Protocol conformance

protocol Describable {
    func describe() -> String
}

struct Car {
    var brand: String
    var speed: Int
}

// Conformance via extension
extension Car: Describable {
    func describe() -> String {
        return "\(brand) driving at \(speed) km/h"
    }
}

let c = Car(brand: "Tesla", speed: 120)
print(c.describe())  // Tesla driving at 120 km/h

