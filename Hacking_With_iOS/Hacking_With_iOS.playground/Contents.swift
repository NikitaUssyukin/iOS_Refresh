import UIKit

var greeting = "Hello, playground"

struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I've just changed from \(oldValue) to \(clothes)")
        }
    }
    
    func updateUI(msg: String) {
        print(msg)
    }
}

var taylor = Person(clothes: "T-shirts")
taylor.clothes = "short skirts"

struct AnotherPerson {
    var age: Int
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    
    var ageInMonths: Int {
        return age * 12
    }
}

var person = AnotherPerson(age: 7)
person.ageInDogYears
person.ageInMonths
