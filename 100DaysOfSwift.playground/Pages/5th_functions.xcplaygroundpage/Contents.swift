//functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}

printHelp()

//accepting parameters
func square(number: Int) {
    print(number * number)
}

square(number: 99)

//returning values
func double(number: Int) -> Int {
    return number + number
}

let result = double(number: 88)
print(result)

//parameter labels
func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Liza")

//omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Dude")

//default parameters
func greetAlt(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Hello, \(person)!")
    } else {
        print("Go away, \(person)!")
    }
}

greetAlt("Kim")
greetAlt("Angela", nicely: false)

//variadic functions
//variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array
func squares(_ numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

squares(1, 3, 2, 7, 99)

//trowing functions
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

//running trowing functions
//swift won’t let you run an error-throwing function by accident
//do starts a section of code that might cause problems, try is used before every function that might throw an error, and catch lets you handle errors
//if any errors are thrown inside the do block, execution immediately jumps to the catch block
do {
    try checkPassword("password")
    print("Password is good")
} catch {
    print("Password can't be used")
}

do {
    try checkPassword("notpassword")
    print("Password is good")
} catch {
    print("Password can't be used")
}

//inout parameters
//all parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function
func doubleInPlace(number: inout Int) {
    number *= 2
}

//to use that, you first need to make a variable integer – you can’t use constant integers with inout, because they might be changed. You also need to pass the parameter to doubleInPlace using an ampersand, &, before its name, which is an explicit recognition that you’re aware it is being used as inout
var myNum = 10
doubleInPlace(number: &myNum)
//you can use inout to change variables inside a function, but it’s usually better to return a new value
