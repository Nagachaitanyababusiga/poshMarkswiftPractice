

//Raw Values

enum Direction: String{
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

let d = Direction.north
print(d.rawValue)

//Associated values

enum Result{
    case success(_ data: String)
    case failed(_ msg: String)
}

let s = Result.success("success is done ");
let f = Result.failed("There is some error")

//Pattern Matching
// we can use switch statements to extract values from result

let val: Result = f;

switch val {
    case .success(let data):
        print(data)
    case .failed(let msg):
        print(msg)
}


//Recursive Enums ---> very advanced topic
enum Expression {
    case number(Int)
    indirect case addition(Expression, Expression)
    indirect case multiplication(Expression, Expression)
}

let expr = Expression.addition(.number(2), .multiplication(.number(3), .number(4)))


func evaluate(_ expr: Expression) -> Int {
    switch expr {
    case .number(let n):
        return n
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(expr)) // 14
