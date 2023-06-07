//Operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore

//Operators overloading
let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

//Compound operators
var score = 95
score -= 5
score *= 2
score /= 2
score %= 4

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

//Compartison operators
firstScore == secondScore
firstScore != secondScore
firstScore < secondScore
firstScore >= secondScore
//Strings are compared by alphabetical order
"Toyota" <= "Supra"
"Toyota" >= "Supra"

//Conditions
if firstScore + secondScore == 17 {
    print("Failure")
} else if firstScore + secondScore == 18 {
    print("Success")
} else {
    print("Neither")
}

if firstScore > 3 && secondScore > 3 {
    print("both are over 3")
}

if firstScore > 10 || secondScore > 10 {
    print("one of the scores is over 10")
}

//The ternary operators
print(firstScore == secondScore ? "Scores are the same" : "Scores are different")

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough
default:
    print("Enjoy your day!")
}

//Range operators
let points = 85

switch points {
case 0..<50:
    print("F")
case 50..<85:
    print("B")
default:
    print("A")
}
