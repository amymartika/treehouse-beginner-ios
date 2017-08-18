
let x1 = 0
let y1 = 0

// These two constants need to tie together

let coordinate1: (x: Int, y: Int) = (0,0)
coordinate1.x

/*
 --------------------------------------------------------
 Structs, Methods, Instances, Initializers, Classes, Self
 --------------------------------------------------------

 * OOP *

 OOP is a style wherein we model information into data structures of objects.
 The advantage of objects is that we can associate a function with the data contained inside.
 Use upper camel case for structs and classes.
 
 * STRUCTS *

 When you work with data, you don't want to just store it. You might want to work with
 it, manipulate it, etc. This is what makes structs different from tuples.
 
 A struct is one of the objects we can use in Swift to create a custom data type.
 It can use stored properties to encapsulate values. A struct can also have functions
 that work on the data associated with these stored properties.
 
 A struct is like an ice cube tray, which provides the opportunity to create many different kinds
 of solidified substances. The struct is the blueprint. The instance is putting the blueprint into
 action to create different end results (or adding water to the ice cube tray and freezing it).
 
 Structs work well for creating units of data (x and y together, for example).
 
 * METHODS *
 
 A function associated with an object is called a method.
 
 A method is any function that is associated with a particular type. Methods and functions are
 just about the same, but methods are used more in OOP and they alert another developer if there's
 an error with an object.
 
 * INSTANCES *

 Both the stored properties and the functions that we've seen are scoped to an instance
 of the struct, meaning we can't use the struct unless we specifically create an instance.
 
 To create an instance, we start with the name of the struct and then use memberwise
 initializer method (that Swift automatically creates) to assign values to each of the
 stored properties. We can write out an initializer method ourselves by creating a special
 method using the init keyword.
 
 You can access any instance method or property from inside any other instance method.
 
 * INITIALIZERS *
 
 The purpose of an initializer is to assign values to all the stored properties during creation.
 You cannot write an init method that does not assign an initial value to a stored property.
 
 An init method is simply a special instance method that can take paramters like any function.
 Inside the init method, we can set or modify the initial values for any stored properties.
 
 * CLASSES * 
 
 Classes need us to explicitly write out an initializer method, while structs automatically
 create a memberwise initializer for us.
 
 You can set an initial value either in the argument or in the init method. If the initial value
 of your object can sensibly be defined before creation of the object, then go ahead and assign
 that value directly. Otherwise, use an initializer method to delay the assigning of values until
 you have more data. For example, you don't want to set position because you don't want all enemies
 to be positioned at the same place. But you may want all enemties to start with a life of 2.
 
 * SUBCLASSES & SUPERCLASSES *
 
 DRY - Don't Repeat Yourself. This is the mindset behind creating subclasses.
 
 When determining if you should create a subclass or a separate class, ask yourself the
 "is a?" question. "Is a laser tower also a tower?" If yes, use inheritance and subclass
 to create your new type.
 
 Creating a subclass also creates an instance of the superclass. Subclasses inherit the
 initializer methods from their parent class.
 
 Whenever you create an instance of a subclass, Xcode will go through and use its initializer
 method, and it will follow your rules. First, it will assign values to any new properties in 
 the sub-class that already have a value assigned. Next, it will focus on getting the superclass
 set up. To do that, we'll use the superclass' initializer method and pass in the values. Once
 that's done, both the subclass and superclass are ready for use.
 
 Any additional arguments created in the subclass that don't have an initial default value
 must be assigned one in the initializer method.
 
 A key benefit of subclasses and inheritance is not repeating ourselves, but it's not the only
 one. It also allows us to refine the subclass and either modify existing properties or add new ones.
 
 When you overwrite a method in the subclass, you can't change the name of the method, any
 arguments, or the return type, but you can change the body.
 
 * INITIALIZING A SUB-CLASS * 
 
 1. Provide values for properties of the subclass.
 2. Once the subclass is initialized, provide values for properties of the base class.
 
 * SELF *
 
 Inside the init method, we need to refer to an instance of the structure. Use the keyword "self."
*/

 struct Point {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x // x = x
        self.y = y // y = y
    }
    
    /// Return surrounding points
    func Points(inRange range: Int = 1) -> [Point] {
        var results: [Point] = [] // Declaring an empty array
        
        let lowerBoundOfXRange = x - range
        let upperBoundOfXRange = x + range
        
        let lowerBoundOfYRange = y - range
        let upperBoundOfYRange = y + range
        
        for xCoordinate in lowerBoundOfXRange...upperBoundOfXRange {
            for yCoordinate in lowerBoundOfYRange...upperBoundOfYRange {
                let coordinatePoint = Point(x: xCoordinate, y: yCoordinate)
                results.append(coordinatePoint)
            }
        }
        
        return results
    }
}

let coordinatePoint = Point(x: 0, y: 0)
// An instance of the struct

/*
 ----------------
 Calling a Method
 ----------------
*/

coordinatePoint.Points()

coordinatePoint.x

struct User {
    let name: String // Must provide a type since we're not assigning initial values
    var email: String
}

let user = User(name: "Jim", email: "jim@j.com")

/*
 ------------------
 Tower Defense Game
 ------------------
*/

// Enemies

class Enemy {
    var life: Int = 2
    let position: Point
    
    init(x: Int, y: Int) { // Could also be init(Position)
        self.position = Point(x: x, y: y)
    }
    
    func decreaseLife(by factor: Int) {
        life -= factor // Same as saying life = life - factor
    }
}

class SuperEnemy: Enemy { // Inheritance: SuperEnemy is a sub-class of Enemy (superclass)
    
    let isSuper: Bool = true
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y) // Here, super refers to the superclass, Enemy
        self.life = 50
    }
}

// Towers 

class Tower {
    let position: Point
    var range: Int = 1
    var strength: Int = 1 // Pass in strength value to determine how quickly enemy life decreases
    
    init(x: Int, y: Int) {
        self.position = Point(x: x, y: y)
    }
    
    // We want our towers to be able to fire
    func fire(at enemy: Enemy) { // Because Enemy is the type, we don't have to include in "atEnemy"
        if isInRange(of: enemy) {
            enemy.decreaseLife(by: strength)
            print("Gotcha")
        } else {
            print("Darn: Out of range!")
        }
    }
    
    // Determining range is a separate function from firing
    func isInRange(of enemy: Enemy) -> Bool {
        let availablePositions = position.Points(inRange: range)
        // Easy to determine range becuase of instance method on the Point struct (advantage of OOP)
        
        // Below is a helper method
        
        for point in availablePositions {
            if point.x == enemy.position.x && point.y == enemy.position.y {
                return true
            }
        }
        
        return false
    }
}

class LaserTower: Tower {
    
    override init(x: Int, y: Int) {
        super.init(x: x, y: y)
        self.range = 100
        self.strength = 100
    }
    
    override func fire(at enemy: Enemy) { // We don't need to check range for LaserTower
        while enemy.life >= 0 {
            enemy.decreaseLife(by: strength)
        }
        
        print("Enemy destroyed!")
    }
}

let tower = Tower(x: 0, y: 0) // Because we didn't set position, we can declare it for a new tower
let enemy = Enemy(x: 1, y: 1)
let secondEnemy = Enemy(x: 4, y: 5)
let laserTower = LaserTower(x: 2, y: 2)

tower.fire (at: secondEnemy)

/*
 --------------
 Code Challenge
 --------------
*/

struct Person {
    let firstName: String
    let lastName: String
    
    func fullName() -> String {
        let fullName = firstName + " " + lastName
        return fullName
    }
}

let aPerson = Person(firstName: "Ashley", lastName: "Sullins")

let myFullName = aPerson.fullName()

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

struct RGBColor {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
    let description: String
    
    // Add your code below
    
    init(red: Double, green: Double, blue: Double, alpha: Double) {
        self.red = 86.0
        self.green = 191.0
        self.blue = 131.0
        self.alpha = 1.0
        
        self.description = "red: \(red), green: \(green), blue: \(blue), alpha: \(alpha)"
    }
}

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

class Shape {
    var numberOfSides: Int
    
    init(numberOfSides: Int) {
        self.numberOfSides = numberOfSides
    }
}

let someShape = Shape(numberOfSides: 4)

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

struct Location {
    let latitude: Double
    let longitude: Double
}

class Business {
    let name: String
    let location: Location
    
    init(name: String, location: Location) {
        self.name = name
        self.location = location
    }
}

let someBusiness = Business(name: "Indent Labs", location: Location(latitude: 4.1, longitude: 29.3))
// Need to create a new Location object as the paramater

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

class Vehicle {
    var numberOfDoors: Int
    var numberOfWheels: Int
    
    init(withDoors doors: Int, andWheels wheels: Int) {
        self.numberOfDoors = doors
        self.numberOfWheels = wheels
    }
}

class Car: Vehicle {
    
    let numberOfSeats: Int = 4
    
    override init(withDoors: Int, andWheels: Int) {
        super.init(withDoors: 2, andWheels: 4)
    }
}

let someCar = Car(withDoors: 2, andWheels: 4)

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

class ThisPerson {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

class Doctor: ThisPerson {
    let title: String = "Dr."
    
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    override func fullName() -> String {
        return "\(title) \(lastName)"
    }
}

let someDoctor = Doctor(firstName: "Sam", lastName: "Smith")
someDoctor.fullName()

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

struct Tag {
    let name: String
}

struct Post {
    let title: String
    let author: String
    let tag: Tag
    
    func description() -> String {
        let description = "\(title) by \(author). Filed under \(tag.name)"
        return description
    }
}

let firstPost = Post(title: "Age of Innocence", author: "Edith Wharton", tag: Tag(name: "Amy"))
let postDescription = firstPost.description()

// End of challenge
