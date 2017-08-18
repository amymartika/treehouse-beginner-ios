
/* 
 ----------------
 Binary Operators
 ----------------
*/

let height: Double = 12 // in feet
let width: Double = 10 // in feet

let area = height * width // Area in sq feet

// 1 sq meter = 1 sq foot / 10.764

let areaInMeters = area/10.764

/*
 ---------------
 Equals Operator
 ---------------
 
 Note: Different from assignment operator
*/

let string1 = "Hello!"
let string2 = "Hello!"
let string3 = "hello"

string1 == string2
string1 == string3

/*
 ------------------
 Not Equal Operator
 ------------------
*/

string1 != string2
string1 != string3

/*
 ---------------------
 Greater Than Operator
 ---------------------
*/

1 > 2
2 > 1

"a" > "b"

/*
 -------------------
 Operator Precedence
 -------------------
*/

var x = 100 + 100 - ((5 * 2) / 3) % 7

// Same as PEMDAS, except % is after * and /

/*
 ---------------
 Unary Operators
 ---------------
*/

var levelScore = 0

levelScore += 1
// levelScore = levelScore + 1

levelScore -= 1
// levelScore = levelScore - 1

/*
 ------------
 Not Operator
 ------------
*/

let on = true
let off = !on

1 != 2
