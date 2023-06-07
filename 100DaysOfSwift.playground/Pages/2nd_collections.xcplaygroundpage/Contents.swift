//Arrays
//If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array
//Arrays store items in the order you add them, and you access them using numerical positions
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]

//Sets
//If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set
//Sets store items without any order, so you can’t access them using numerical positions
let colors = Set(["red", "green", "blue"])
//if we try to insert duplicates into a set, they get ignored
let colorsAlt = Set(["red", "green", "blue", "red", "green", "blue"])

//Tuples
//If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple
//Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names of the items
var car = (manufacturer: "Mazda", model: "Miata")

car.0
car.manufacturer
car.model

car = (manufacturer: "Honda", model: "Civic")

car.manufacturer
car.model

//Dictionaries
//Dictionaries store items according to a key, and you can read items using those keys
let prices = [
    "RX6600": 315,
    "RX6500XT": 160
]

let pricesAlt: [String: Int] = [
    "RX6600": 315,
    "RX6500XT": 160
]

prices["RX6600"]
prices.keys
prices.count
prices.capacity
prices.values

//Dictionary default values
let engines = [
    "Toyota": "2JZ-GTE",
    "Nissan": "RB26DETT",
]

engines["Mazda"]

engines["Mazda", default: "N/A"]

//Creating empty collections
var teams = [String: String]()

teams["Paul"] = "Red"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
var resultsAlt = Array<Int>()

//Enumerations
//Enums are a way of grouping related values so you can use them without spelling mistakes
enum Result {
    case success
    case failure
}

let resultAlt = Result.failure

//You can add associated values to store additional information about each case
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "cars")

//You can attach raw values to enums so they can be created from integers or strings
enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

enum PlanetAlt: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earthAlt = PlanetAlt(rawValue: 3)
