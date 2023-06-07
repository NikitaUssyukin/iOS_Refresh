//Protocols and extensions
//Protocols
protocol Identifiable {
    var id: String { get set }
}

//we can’t create instances of that protocol - it’s a description of what we want, rather than something we can create and use directly. But we can create a struct that conforms to it
struct User: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

//Protocol inheritance
//one protocol can inherit from another in a process known as protocol inheritance. Unlike with classes, you can inherit from multiple protocols at the same time before you add your own customizations on top
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

//we can now create a single Employee protocol that brings them together in one protocol. We don’t need to add anything on top, so we’ll just write open and close braces
protocol Employee: Payable, NeedsTraining, HasVacation { }
//now we can make new types conform to that single protocol rather than each of the three individual ones

//Extensions
//extensions allow you to add methods to existing types, to make them do things they weren’t originally designed to do
extension Int {
    func squared() -> Int {
        return self * self
    }
}

let number = 8
number.squared()

//Swift doesn’t let you add stored properties in extensions, so you must use computed properties instead. For example, we could add a new isEven computed property to integers that returns true if it holds an even number
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

number.isEven

//Protocol extensions
//protocols let you describe what methods something should have, but don’t provide the code inside. Extensions let you provide the code inside your methods, but only affect one data type – you can’t add the method to lots of types at the same time
//protocol extensions solve both those problems: they are like regular extensions, except rather than extending a specific type like Int you extend a whole protocol so that all conforming types get your changes

let cars = ["Nissan", "Toyota", "Porsche", "Mazda"]
let planes = Set(["Boeing", "Airbus", "Cessna", "Piper"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

//both array and set will now have a method, so we can try it out:
cars.summarize()
planes.summarize()

//Protocol-oriented programming
protocol SecondIdentifiable {
    var id: String { get set }
    func identify()
}
//we could make every conforming type write their own identify() method, but protocol extensions allow us to provide a default
extension SecondIdentifiable {
    func identify() {
        print("My ID is \(id).")
    }
}
//now when we create a type that conforms to Identifiable it gets identify() automatically
struct IdentifiableUser : SecondIdentifiable {
    var id: String
}

let twostraws = IdentifiableUser(id: "twostraws")
twostraws.identify()
