
/*
 --------------------
 Why Use Enumerations
 --------------------
 
 Syntax: 
 - One-word, upper camel case name for enum.
 - Lowercase for cases.
*/

let week = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

func dayType(for day: String) -> String {
    switch day {
    case "Saturday", "Sunday": return "Weekend"
    case "Monday", "Tuesday", "Wednesday", "Thursday", "Friday": return "Weekday"
    default: return "This isn't a valid day in the Western calendar"
    }
}

func isNotificationMuted(on day: String) -> Bool {
    if day == "Weekend" {
        return true
    } else {
        return false
    }
}

// let result = dayType(for: week[4])
// let isMuted = isNotificationMuted(on: result)

// This strategy will generate errors on days with typos
// Instead, use an enum

enum Day: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

Day.friday.rawValue
// Auto incrementing in an enum with Int raw values

enum DayType {
    case weekend
    case weekday
}

func dayType(for day: Day) -> DayType { // You can have functions with same name if they take different types (String and Day, for example)
    switch day {
    case .saturday, .sunday: return .weekend
    default: return .weekday
    }
}

func isNotificationMuted(on type: DayType) -> Bool {
    switch type { // Switch statements and enums work very well together
    case .weekend: return true
    case .weekday: return false
    }
}

// Now we have no string literals, which will drastically reduce errors

let type = dayType(for: .saturday)
let isMuted = isNotificationMuted(on: type)

/*
 -------------------------------
 Associated Properties & Methods
 -------------------------------
 
 Associated values do not need to be the same for all cases in an enum.
*/

import UIKit

enum ColorComponent {
    case rgb(red: Float, green: Float, blue: Float, alpha: Float)
    case hsb(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)
    
    func color() -> UIColor {
        switch self { // Switch statement will call on value
        case .rgb(let red, let green, let blue, let alpha):
            return UIColor(colorLiteralRed: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
        case .hsb(let hue, let saturation, let brightness, let alpha):
            return UIColor(hue: hue/360.0, saturation: saturation/100.0, brightness: brightness/100.0, alpha: alpha)
        }
    }
}

ColorComponent.rgb(red: 61.0, green: 120.0, blue: 198.0, alpha: 1.0).color()

/*
 ----------------------------
 Enumerations with Raw Values
 ----------------------------
 
 - Raw values are not associated values.
 - Use raw values when you want an enum member to have a default value,
 whereas associated values are set when you create the enum and can be
 different values for every instance.
 - Raw values also cannot be custom types.
*/

enum Coin: Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.10
    case quarter = 0.25
}

let coins: [Coin] = [.penny, .nickel, .dime, .dime, .quarter, .quarter, .quarter]

func sum(having coins: [Coin]) -> Double {
    var total: Double = 0
    
    for coin in coins {
        total += coin.rawValue
    }
    
    return total
}

sum(having: coins)

enum HTTP: String {
    case post
    case get
    case put
    case delete
}

HTTP.delete.rawValue
// Name of enum member in an enum with undeclared String raw values

enum HTTPStatuscode: Int {
    case success = 200
    case forbidden = 403
    case unauthorized = 401
    case notFound = 404
}

let statusCode = 200

if let httpStatusCode = HTTPStatuscode(rawValue: statusCode) {
    print(httpStatusCode)
}
// httpStatusCode is an optional, so we need to use an if let or guard statement

/*
 --------------
 Code Challenge
 --------------
*/

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

enum Direction {
    case left
    case right
    case up
    case down
}

class Robot {
    var location: Point
    
    init() {
        self.location = Point(x: 0, y: 0)
    }
    
    func move(_ direction: Direction) {
        switch direction {
        case .up: location.y += 1
        case .down: location.y -= 1
        case .right: location.x += 1
        case .left: location.x -= 1
        }
    }
}

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

enum MobilePhone {
    case iphone(String)
    case android(String)
    case windowsPhone(String)
}

let iphone = MobilePhone.iphone("7 Plus")

// End of challenge

/*
 --------------
 Code Challenge
 --------------
 
 Example of UIBarButtonItem instance
 let someButton = UIBarButtonItem(title: "A Title", style: .plain, target: nil, action: nil)
 
 In the method, using the associated values as titles for the button, return a button with style UIBarButtonStyle.done for the done member of the BarButton enum. Similarly for the edit member, return a UIBarButtonItem instance with the style set to UIBarButtonStyle.plain.
 
 In both cases you can pass nil for target and action. Once you have a method, call it on the value we created in the previous task and assign it to a constant named button.
*/

enum BarButton {
    case done(title: String)
    case edit(title: String)
    
    func button() -> UIBarButtonItem {
        switch self {
        case .done(let title): return UIBarButtonItem(title: title, style: .done, target: nil, action: nil)
        case .edit(let title): return UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        }
    }
}

let done = BarButton.done(title: "Save")
let button = done.button()

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

enum Compass: Int {
    case north = 1
    case south
    case east
    case west
}

let direction = Compass(rawValue: 2)

// End of challenge
