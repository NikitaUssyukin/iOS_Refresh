//closures, part one
//Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.
//Functions used in this way are called closures, and although they work like functions they are written a little differently.
let driving = {
    print("I'm driving in my car")
}
driving()

//accepting parameters
//in closures, parameters are listed inside the open braces
//to make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting
let moreDriving = { (place: String) in
    print("I'm going to \(place) in my car")
}
//one of the differences between functions and closures is that you don’t use parameter labels when running closures.
moreDriving("London")

//returning values from a closure
//closures can also return values, and they are written similarly to parameters: you write them inside your closure, directly before the in keyword, then use return just like a normal function
let andMoreDriving = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = andMoreDriving("Moscow")
print(message)

//closures as parameters
//if we wanted to pass the closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
//we can now call that using our driving closure
travel(action: driving)

//trailing closure syntax
//If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.
travel() {
    print("I'm driving in my car")
}

travel {
    print("I'm driving in my car")
}

