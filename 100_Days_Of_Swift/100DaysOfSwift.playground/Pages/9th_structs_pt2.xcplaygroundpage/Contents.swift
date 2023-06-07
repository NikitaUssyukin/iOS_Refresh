//closures, part two
//initializers
//Initializers are special methods that provide different ways to create your struct. All structs come with one by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.
struct User {
    var username: String
}

var user = User(username: "twostraws")

struct InitUser {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Created a new user!")
    }
}

var initUser = InitUser()
initUser.username = "Twostraws"
initUser.username
//self, referring to the current instance
//Inside methods you get a special constant called self, which points to whatever instance of the struct is currently being used. This self value is particularly useful when you create initializers that have the same parameter names as your property.
//For example, if you create a Person struct with a name property, then tried to write an initializer that accepted a name parameter, self helps you distinguish between the property and the parameter – self.name refers to the property, whereas name refers to the parameter.
struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

var person = Person(name: "Alice")

//lazy properties
//as a performance optimization, Swift lets you create some properties only when they are needed. As an example, consider this FamilyTree struct – it doesn’t do much, but in theory creating a family tree for someone takes a long time
//if we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct FamilyPerson {
    var name: String
    lazy var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}

var ed = FamilyPerson(name: "Ed")
ed.familyTree

//static properties and methods
//you can ask Swift to share specific properties and methods across all instances of the struct by declaring them as static
//we’re going to create a static property in the Student struct to store how many students are in the class. Each time we create a new student, we’ll add one to it
struct Student {
    static var classSize = 0
    var name: String
    
    init(_ name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let nick = Student("Nick")
let taylor = Student("Taylor")
//because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize
print(Student.classSize)

//access control
//access control lets you restrict which code can use properties and methods. In the example below, only methods inside Person can read the id property
struct SecurePerson {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let tim = SecurePerson(id: "12345")
tim.identify()

