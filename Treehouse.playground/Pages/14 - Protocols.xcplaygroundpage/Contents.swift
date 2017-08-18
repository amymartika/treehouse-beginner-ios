
/*
 ---------
 Protocols
 ---------
 
 - When we have a set of closely related classes that implement
 methods that define similar behavior but end up having different
 implementations, protocols lead to better code than inheritance.
 - Protocols encapsulate common behavior without resorting
 to inheritance.
 - Protocols can be used wherever a type is expected.
*/

protocol FullNameable {
    var fullName: String { get }
}

struct User: FullNameable {
    var fullName: String
}

let user = User(fullName: "John Smith")

struct Friend: FullNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Taylor", middleName: "Alison", lastName: "Swift")
friend.fullName

/*
 ------------------------
 Why Protocols Are Useful
 ------------------------

 - An example of setting up payroll without protocols (below).
 - Because there are no errors raised in the code, we're
 opening the door for lots of bugs.
 
 import Foundation
 
 enum EmployeeType {
 case manager
 case traditional
 }
 
 struct Paycheck {
 let base: Double
 let benefits: Double
 let deductions: Double
 let vacation: Double
 }
 
 class Employee {
 let name: String
 let address: String
 let startDate: Date
 let type: EmployeeType
 
 init(name: String, address: String, startDate: Date, type: EmployeeType) {
 self.name = name
 self.address = address
 self.startDate = startDate
 self.type = type
 }
 
 func pay() -> Paycheck {
 return Paycheck(base: 0, benefits: 0, deductions: 0, vacation: 0)
 }
 }
 
 class HourlyEmployee: Employee {
 var hourlyWage = 15.00
 var hoursWorked = 0.0
 let vacation = 0
 
 override func pay() -> Paycheck {
 let base = hourlyWage * hoursWorked
 return Paycheck(base: base, benefits: 0, deductions: 0, vacation: 0)
 }
 }
 
 class SalariedEmployee: Employee {
 var salary = 50000.00
 var benefits = 1000.00
 var deducations = 0.0
 var vacation = 2
 }
 
 func pay(employee: Employee) {
 employee.pay()
 }
*/

import Foundation

enum EmployeeType {
    case manager
    case traditional
}

protocol Payable {
    func pay() -> Paycheck
}

struct Paycheck {
    let base: Double
    let benefits: Double
    let deductions: Double
    let vacation: Double
}

class Employee {
    let name: String
    let address: String
    let startDate: Date
    let type: EmployeeType
    
    init(name: String, address: String, startDate: Date, type: EmployeeType) {
        self.name = name
        self.address = address
        self.startDate = startDate
        self.type = type
    }
}

class HourlyEmployee: Employee, Payable {
    var hourlyWage = 15.00
    var hoursWorked = 0.0
    let vacation = 0
    
    func pay() -> Paycheck {
        let base = hoursWorked * hourlyWage
        return Paycheck(base: base, benefits: 0, deductions: 0, vacation: 0)
    }
}

class SalariedEmployee: Employee, Payable {
    var salary = 50000.00
    var benefits = 1000.00
    var deducations = 0.0
    var vacation = 2.0
    
    func pay() -> Paycheck {
        let monthly = salary/12
        return Paycheck(base: monthly, benefits: benefits, deductions: deducations, vacation: vacation)
    }
}

func pay(employee: Payable) { // Guarantees we only pass in a type that conforms to payable protocol
    employee.pay()
}

let employee = SalariedEmployee(name: "Pasan", address: "someAddress", startDate: Date(), type: .traditional) // This breaks unless we specificy an hourly or salaried employee
pay(employee: employee)

/*
 ---------------------
 Loosely Related Types
 ---------------------
*/

protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        print("I'm mush!")
    }
}

class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {}

class Milk: Dairy, Blendable {
    func blend() {
        print("I haven't changed at all. I'm still milk!")
    }
}
    
func makeSmoothie(with ingredients: [Blendable]) { // Has to be an array that contains any type that conforms to Blendable
    for ingredient in ingredients {
        ingredient.blend()
    }
}

let strawberry = Fruit(name: "Strawberry")
let cheddar = Cheese(name: "Cheddar")
let chocolateMilk = Milk(name: "Chocolate Milk")

let ingredients: [Blendable] = [strawberry, chocolateMilk] // We want to create an array that only allows types that conform to Blendable

makeSmoothie(with: ingredients)

/*
 -----------------------
 Random Number Generator
 -----------------------
*/

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom/m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
d6.roll()

/*
 --------------------
 Protocol Inheritance
 --------------------
 
 * Inheritance vs. Composition *
 - When we have an "is-a" relationship, inheritance is best suited
 as our design pattern. (A class wants to model the exact same
 behavior and attributes of another class.)
 - When we have a "has-a" relationship, we use composition. Neither
 a bird nor a plane is a sub-class of the other, but they have
 flying in common. Then we may want a protocol for flying.
 
 * Benefits of Inheritance *
 - Unlike classes, which can only inherit from a single base class,
 protocols can inherit from multiple protocols.
 - We can build up protocools to set up a larger set of requirements.
 
 * Three Types of Swift Standard Library Protocols *
 - Can do: used to represent behavior (ex: Equatable)
 - Is a: the protocol models a concrete type
 - Can be: model behavior where one type can be converted to
 another type (ex: ExpressibleByFloatLiteral, ExpressibleByArrayLiteral,
 CustomStringConvertible)
*/

protocol Printable {
    func description() -> String
}

protocol PrettyPrintable: Printable { // Inheriting from Printable
    func prettyDescription() -> String
}

struct AnotherUser: PrettyPrintable, Equatable { // Equatable is from Swift's Standard Library
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
    }
    
    func prettyDescription() -> String {
        return "name: \(name)\nage: \(age)\naddress: \(address)" // \n marks new line
    }
    
    static func ==(lhs: AnotherUser, rhs: AnotherUser) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.address == rhs.address
    }
}

let anotherUser = AnotherUser(name: "Pasan", age: 28, address: "someAddress")

anotherUser.description()
print(anotherUser.prettyDescription())

let aThirdUser = AnotherUser(name: "Pasan", age: 28, address: "someAddress")
anotherUser == aThirdUser // Equatable protocol in action

/*
 --------------
 Code Challenge
 --------------
*/

protocol Pilot {
    var name: String { get }
    var age: Int { get set }
}

struct Human: Pilot {
    var name: String
    var age: Int
}

let somePerson = Human(name: "Andrew Brown", age: 26)

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

enum LightState {
    case on, off
}

enum Color {
    case rgb(Double, Double, Double, Double)
    case hsb(Double, Double, Double, Double)
}

protocol ColorSwitchable {
    func switchColor(_ color: Color)
}

class WifiLamp: ColorSwitchable {
    let state: LightState
    var color: Color
    
    func switchColor(_ color: Color) {
        self.color = color // Set color to color passed into the method
    }
    
    init() {
        self.state = .on
        self.color = .rgb(0,0,0,0)
    }
}

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

protocol Animal {
    var numberOfLegs: Int { get }
}

protocol Pet: Animal {
    var cuddlyName: String { get }
}

struct Dog: Pet {
    var numberOfLegs = 4
    var cuddlyName = "Mr. Fluffy" // All code challenges should be like this
}

// End of challenge
