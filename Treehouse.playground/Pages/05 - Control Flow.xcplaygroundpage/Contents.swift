
var todo: [String] = ["Finish collections course", "Buy groceries", "Respond to emails", "Pick up dry cleaning", "Order books online", "Mow the lawn"]

let firstItem = todo[0]
print(firstItem)

print(todo[0])
print(todo[1])
print(todo[2])

for task in todo {
    print(task)
}

/*
 ------
 Ranges
 ------
*/

1...10
1..<10

/*
 --------
 For Loop
 --------
*/

for number in 1...10 {
    print("\(number) times 5 is equal to \(number * 5)")
}

/*
 --------------
 Code Challenge
 --------------
*/
 
 var results: [Int] = []
 
 for multiplier in 1...10 {
 var value = multiplier * 6
 results.append(value)
 }

// End of challenge

/*
 ----------
 While Loop
 ----------
*/

var x = 0

while x <= 20 {
    print(x)
    x += 1
}

var index = 0

while index < todo.count {
    print(todo[index])
    index += 1
}

/*
 -----------------
 Repeat While Loop
 -----------------
 
 If you want to repeat a certain activity a number of times until some condition becomes
 false, use the while loop. If you have the same criteries, but you always want the body
 of the loop to be evaluated at least once regardless of whether the condition is true
 or false, then use the repeat while loop instead.
*/

var counter = 1

while counter < 1 {
    print("I'm inside the while loop")
    counter += 1
}

repeat {
    print("I'm inside the repeat loop")
    counter += 1
} while counter < 1

/* 
 --------------
 Code Challenge
 --------------
*/
 
 var numbers = [1,3,2,9,15,21]
 var sum = 0
 // var counter = 0
 
 while counter < numbers.count {
    let newValue = (numbers[counter])
    sum += newValue
    counter += 1
 }
 
// End of Challenge

/*
 -------------
 If Statements
 -------------
*/

var temperature = 14

if temperature < 12 {
    print("It's getting cold. Let's get that jacket out.")
} else if temperature < 18 {
    print("It's getting chilly. I recommend wearing a light sweater.")
} else {
    print("It feels great outside! A t-shirt will do.")
}

/*
 -----------------
 Logical Operators
 -----------------
*/

if temperature > 7 && temperature < 12 {
    print("Might want to wear a scarf with that jacket.")
}

var isRaining = true
var isSnowing = false

if isRaining || isSnowing {
    print("Get out those boots!")
}

if !isRaining {
    print("Yay, the sun is out!")
}

if isRaining && isSnowing && temperature < 2 {
    print("Put some gloves on!")
}

if (isRaining || isSnowing) && temperature < 2 {
    print("Definitely get the leather gloves out.")
}

/*
 -----------------
 Switch Statements
 -----------------
*/

let airportCodes = ["LGA", "LHR", "CDG", "HKG", "DXB", "LGW", "JFK", "ORY"]

for airportCode in airportCodes {
    switch airportCode {
    case "LGA", "JFK": print("New York")
    case "LHR", "LGW": print("London")
    case "CDG", "ORY": print("Paris")
    case "HKG": print("Hong Kong")
    default: print("I don't know which city that airport is in!")
    }
}

import GameKit

let randomTemperature = GKRandomSource.sharedRandom().nextInt(upperBound: 150)
// Don't worry about the meaning of this line yet

switch randomTemperature {
case 0..<32: print("Forget clothes, you are basically a popsicle")
case 32..<45: print("It's quite cold. You'll need a jacket")
case 45..<70: print("It's a bit chilly. I recommend wearing a light sweater")
case 70...100: print("It's quite hot! T-shirt weather!")
default: print("Don't even bother to go out!")
}

/*
 ------------------
 FizzBuzz Challenge
 ------------------
*/

for i in 1...100 {
    if (i % 3 == 0) && (i % 5 == 0) {
        print("FizzBuzz")
    } else if (i % 3 == 0) {
        print("Fizz")
    } else if (i % 5 == 0) {
        print("Buzz")
    } else {
        print(i)
    }
}

// End of challenge
