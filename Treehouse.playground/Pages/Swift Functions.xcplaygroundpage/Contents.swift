
/*
 ---------
 Functions
 ---------
 
 Anything created within a function exists only inside the function.
 
 Any variable created inside a function is called a local variable.
 Variables created outside a function are called global variables.
 It's preferable to avoid global variables/constants as much as possible.
*/

// Area of room #1

let length = 10
let width = 12

let areaOfRoom = length * width

// Area of room #2

let secondLength = 14
let secondWidth = 8

let secondArea = secondLength * secondWidth

func area(length: Int, width: Int) -> Int {
    let areaOfRoom = length * width
    
    return areaOfRoom
}

/*
 ------------------
 Calling a Function
 ------------------
*/

// area()

let areaOfFirstRoom = area(length: 10, width: 12)
let areaOfSecondRoom = area(length: 15, width: 22)

areaOfFirstRoom

/*
 ------------------------------
 Representing Void in Functions
 ------------------------------
 
 #1: func someFunction() {}
 #2: func someFunction() -> Void {}
 #3: func someFunction() -> () {}
*/

/*
 ---------------
 Argument Labels
 ---------------
*/

// External name: havingValue, local name: value

func remove(havingValue value: String) {
    print(value)
}

remove(havingValue: "A")

/*
 -----------------------
 Default Values & Tuples
 -----------------------
*/

func carpetCostHaving(length: Int, width: Int, carpetColor color: String = "tan") ->
    (price: Int, carpetColor: String) {
    // Grey carpet - $1/sq ft
    // Tan carpet - $2/sq ft
    // Deep blue carpet - $4/sq ft
    
    let areaOfRoom = area(length: length, width: width)
    
    var price = 0
    
    switch color {
        case "grey": price = areaOfRoom * 1
        case "tan": price = areaOfRoom * 2
        case "blue": price = areaOfRoom * 4
    default: price = 0
    }
    
    return (price, color)
}

let result = carpetCostHaving(length: 10, width: 20)
result.price
result.carpetColor

/*
 -----
 Scope
 -----
 
 Within the same scope, names have to be unique
*/

func arrayModifier(array: [Int]) {
    var arrayOfInts = array
    arrayOfInts.append(5)
    
    // var secondArray = arrayOfInts
}

var arrayOfInts = [1,2,3,4]
arrayModifier(array: arrayOfInts)
arrayOfInts

func someFunction(_ test: Int) {}
someFunction(1)
