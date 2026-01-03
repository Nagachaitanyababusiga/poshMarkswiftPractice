let a1="value"

//conditionals
//if else
if(a1=="value"){
    print("value");
}else{
    print("not a value");
}

//switch-case
let number: Int = 2;

switch(number){
    case 0:
        print("zero")
    case 1..<10:
        print("It is a single digit number")
    case let x where x%2==0:
        print("the number is even: number: \(x)")
    default: 
        print("nothing to worry about")
}

//using guard

func voteRegistration(_ age: Int)->Void{
    guard age>=18 else{
        print("candidaate is too young so, registration failed");
        return;
    }
    print("Registration successfull")
}

voteRegistration(10)
voteRegistration(18)

//loops
//for loop
for i in 1...10{
    print(i, terminator:" ")
}

let names: [String] = ["Naga","Chaitanya","Babu"]
for name in names{
    print(name)
}

//while
var count: Int = 0;
while(count<10){
    print(count, terminator: " ")
    count+=1;
}

//repeat while
count = 10;
repeat{
    print(count, terminator: " ");
    count+=1;
}while(count<10)

print()
//stride
for i in stride(from: 0,through: 10,by: 1){
    print(i,terminator: " ")
}