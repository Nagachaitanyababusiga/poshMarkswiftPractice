enum CustomError: Error{
    case filenotFound
    case noerror
}

//throwing an error
enum FileError: Error {
    case notFound(msg: String)
    case noPermission(msg: String)
}

func readFile(_ file: String) throws -> String{
    if(file.isEmpty){
        throw FileError.notFound(msg: "File is not found bhayya")
    }
    return "Reading file: \(file)"
}

do{
    let res = try readFile("")
    print(res)
}catch FileError.notFound(let msg){
    print(msg)
}catch FileError.noPermission(let msg){
    print(msg)
}

//throws and rethrows
func riskyOperation() throws { /* ... */ }

func performTwice(_ action: () throws -> Void) rethrows {
    try action()
    try action()
}

//try? and try!
var result: String! = try? readFile("")
print(result ?? "nil")

let res: String = try! readFile("hello.txt")
print(res)