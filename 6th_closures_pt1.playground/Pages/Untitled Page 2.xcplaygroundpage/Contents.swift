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

//closures, part two
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

//closures with parameters
//a closure you pass into a function can also accept its own parameters
//we’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () with the types of any parameters that your closure should accept
func moreTravel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

moreTravel { (place: String) in
    print("I'm going to \(place) in my car")
}

//closures with return values
func andMoreTravel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

andMoreTravel { (place: String) -> String in
        return "I'm going to \(place) in my car"
}

//shorthand parameter names
//We can call andMoreTravel() using the code above, however Swift knows the parameter to that closure must be a string, so we can remove it
andMoreTravel { place -> String in
    return "I'm going to \(place) in my car"
}
//Swift also knows the closure must return a string, so we can remove that
andMoreTravel { place in
    return "I'm going to \(place) in my car"
}
//as the closure only has one line of code that must be the one that returns the value, so Swift lets us remove the return keyword too
andMoreTravel { place in
    "I'm going to \(place) in my car"
}
//Swift has a shorthand syntax that lets you go even shorter. Rather than writing place in we can let Swift provide automatic names for the closure’s parameters. These are named with a dollar sign, then a number counting from 0
andMoreTravel {
    "I'm going to \($0) in my car"
}

//closures with multiple parameters
func travelWithSpeed(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived")
}
//call that using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, we’ll be getting both $0 and $1
travelWithSpeed {
    "I'm going to \($0) at \($1) MPH in my car"
}

//returning closures
//In the same way that you can pass a closure to a function, you can get closures returned from a function too.
//The syntax for this is a bit confusing a first, because it uses -> twice: once to specify your function’s return value, and a second time to specify your closure’s return value.
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
//we can now call travel() to get back that closure, then call it as a function:
let res = travel()
res("London")
//it’s technically allowable – although really not recommended! – to call the return value from travel() directly:
let res2 = travel()("London")

//capturing values
func travelWithCounter() -> (String) -> Void {
    var counter = 1
    
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let res3 = travelWithCounter()
res3("London")
res3("Almaty")
res3("Moscow")
