//structs, part one
//creating structs
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"
print(tennis.name)

//computed properties
//we have just created a Sport struct that has a name property that stores a String. These are called stored properties, because Swift has a different kind of property called a computed property – a property that runs code to figure out its value
struct ComputedSport {
    var name: String
    var isOlympic: Bool
    var olympicStatus: String {
        if isOlympic {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
//olympicStatus looks like a regular String, but it returns different values depending on the other properties
let chessBoxing = ComputedSport(name: "Chessboxing", isOlympic: false)
print(chessBoxing.olympicStatus)

//property observers
//for demonstration, we’ll write a Progress struct that tracks a task and a completion percentage
struct Progress {
    var task: String
    var amount: Int
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//what we want to happen is for Swift to print a message every time amount changes, and we can use a didSet property observer for that. This will run some code every time amount changes
struct TrackedProgress {
    var task: String
    var amount: Int {
        //you can also use willSet to take action before a property changes, but that is rarely used
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
//example for demonstration
var trackedProgress = TrackedProgress(task: "Loading data", amount: 0)
trackedProgress.amount = 30
trackedProgress.amount = 80
trackedProgress.amount = 100

//methods
//structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

//mutating methods
//Swift won’t let you write methods inside a struct that change properties unless you specifically request it
//when you want to change a property inside a method, you need to mark it using the mutating keyword
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.name
person.makeAnonymous()
person.name

//properties and methods of strings
//strings are structs – they have their own methods and properties we can use to query and manipulate the string
let string = "Do or do not, there is no try."
string.count
string.hasPrefix("Do")
string.uppercased()
string.sorted()
string

//properties and methods of arrays
//arrays are also structs, which means they too have their own methods and properties we can use to query and manipulate the array
var cars = ["Toyota"]
cars.count
cars.append("Mazda")
cars.firstIndex(of: "Mazda")
cars.sorted()
cars.remove(at: 0)
cars

