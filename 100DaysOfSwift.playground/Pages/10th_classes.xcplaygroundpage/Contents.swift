//classes
//creating classes
//the first difference between classes and structs is that classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer

import Darwin
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")
poppy.name
poppy.breed

//class inheritance
//the second difference between classes and structs is that you can create a class based on an existing class – it inherits all the properties and methods of the original class, and can add its own on top
//we could create a new class based on that one called Poodle. It will inherit the same properties and initializer as Dog by default
//we can also give Poodle its own initializer. We know it will always have the breed “Poodle”, so we can make a new initializer that only needs a name property. Even better, we can make the Poodle initializer call the Dog initializer directly so that all the same setup happens
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}

//overriding methods
//child classes can replace parent methods with their own implementations – a process known as overriding. Here’s a trivial NoisyDog class with a makeNoise() method and a new NoisyPoodle class that inherits from NoisyDog and overrides the makeNoise method

class NoisyDog {
    func makeNoise() {
        print("Woof!")
    }
}

class NoisyPoodle: NoisyDog {
    override func makeNoise() {
        print("Yip!")
    }
}

let doggo = NoisyPoodle()
doggo.makeNoise()

//final classes
//Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written

final class FinalDog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

//copying objects
//the third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other

class Car {
    var model = "A80 Supra"
}

var car = Car()
car.model

var carCopy = car
carCopy.model = "R34 Skyline"
car.model
//if Car was a struct then we would get “Taylor Swift” printed a second time

//deinitializers
//the fourth difference between classes and structs is that classes can have deinitializers – code that gets run when an instance of a class is destroyed

class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//mutability
//the final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant. However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs. This difference means you can change any variable property on a class even when the class is created as a constant.

class Aircraft {
    var model = "P-38 Lightning"
}

let lightning = Aircraft()
lightning.model
lightning.model = "F-35 Lightning II"
lightning.model
//if you want to stop that from happening you need to make the property constant

class Jet {
    let model = "F-22 Raptor"
}

