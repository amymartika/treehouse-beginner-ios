
/*
 --------------------------
 Collections & Control Flow
 --------------------------
*/

/*
 ------
 Arrays
 ------
*/

var numbers: [Int] = [1,2,3]
var todo: [String] = ["Finish collections course", "Buy groceries", "Respond to emails"]

// Add new item to end of array using append method

todo.append("Pick up dry cleaning")

// Concatenating two arrays

[1,2,3] + [4]

// Concatenate array containing string literal to todo

todo = todo + ["Order book online"]

// Performing the same operation using the unary addition operator

todo += ["Make dinner"]

// Addition can only work when types on both sides match
// todo + "someString" <-- Error

/*
 ----------------
 Immutable Arrays
 ----------------
*/

let secondTaskList = ["Mow the lawn"]

// secondTaskList.append("Pay bills") <-- Error
// secondTaskList += ["SomeValue"] <-- Error

/*
 -------------------
 Reading from Arrays
 -------------------
*/

let firstTask = todo[0]
firstTask
let thirdTask = todo[2]
thirdTask

/*
 -----------------
 Mutating an Array
 -----------------
 
 Modifying existing values in an array
*/

todo[4] = "Brush teeth"
todo[0] = "Watch Treehouse content"

// Insert Using Indexes

todo
todo.insert("Watch TV", at: 2)

/*
 --------------------------
 Removing Items from Arrays
 --------------------------
*/

todo
todo.remove(at: 2)
todo

/*
 ---------------------------------
 Check Number of Items in an Array
 ---------------------------------
*/

todo.count
todo[0]
todo[5]

/*
 ------------------------------
 Dealing with Non-Existent Data
 ------------------------------
 
 - Remember that the final item in the array is count minus one
 - Do not use an index value that equals the number of items in the array
 - todo[6] <- Error
*/

/*
 ------------
 Dictionaries
 ------------
 
    - Take a key-value pair, while arrays take a list of values.
    - Dictionary orders are nor preserved. If the order of the values 
    matters, don't use a dictionary.
 
    Airport Code (Key)      Airport Name (Value)
 
    LGA                     La Guardia
    LHR                     Heathrow
    CDG                     Charles de Gaulle
    HKG                     Hong Kong International
    DXB                     Dubai International

*/

var airportCodes: [String: String] = ["LGA": "La Guardia", "LHR": "Heathrow", "CDG": "Charles de Gaulle", "HKG": "Hong Kong International", "DXB": "Dubai International"]

let t: [String: Bool] = ["Pasan": true]
let currentWeather: [String: Double] = ["temperature": 75.0]

/*
 -------------------------
 Reading from a Dictionary
 -------------------------
*/

airportCodes["LGA"]

"LGA" == "lga"

airportCodes["HKG"]

/*
 -------------------------
 Inserting Key Value Pairs
 -------------------------
*/

airportCodes["SYD"] = "Sydney Airport"

airportCodes["LGA"] = "La Guardia International Airport"
airportCodes["LGA"]

airportCodes.updateValue("Dublin Airport", forKey: "DUB")
airportCodes

// Xcode will automatically add the value to the array if it does not exist

/*
 ------------------------
 Removing Key Value Pairs
 ------------------------
*/

airportCodes["DXB"] = nil
airportCodes.removeValue(forKey: "CDG")

airportCodes

/*
 ------------------------------
 Dealing with Non-Existing Data
 ------------------------------
*/

let newYorkAirport = airportCodes["LGA"]
let orlandoAirport = airportCodes["MCO"]
