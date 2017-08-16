
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
 - When we have a set of closely related classes that implement
 methods that define similar behavior but end up having different
 implementations, protocols lead to better code than inheritance.
 
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
