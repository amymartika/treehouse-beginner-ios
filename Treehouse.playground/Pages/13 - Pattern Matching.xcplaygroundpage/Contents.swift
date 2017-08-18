
enum Coin: Double {
    case penny = 0.01
    case nickel = 0.05
    case dime = 0.10
    case quarter = 0.25
}

let wallet: [Coin] = [.penny, .nickel, .dime, .dime, .quarter, .quarter, .quarter, .dime, .nickel, .penny, .penny, .dime, .quarter, .nickel]

// We want to count the number of quarters in the wallet

var count = 0

for coin in wallet {
    switch coin {
    case .quarter: count += 1
    default: continue // This is a control transfer statement, like "return"
    }
}

count = 0

// This does the same thing as above and it's cleaner
for case .quarter in wallet {
    count += 1
}

// Another way to do this
for coin in wallet {
    if case .nickel = coin {
        print("Not so much money")
    } else if case .dime = coin {
        print("Better than nothing")
    }
}

// What if let is doing under the hood
let someOptional: Int? = 42

if case .some(let x) = someOptional {
    print(x)
}

/*
 -----------------------
 Nil Coalescing Operator
 -----------------------
*/

let firstName: String? = "Pasan"
let username = "Pasanpr"

/*
 What we're trying to do: 
 ------------------------
 
var displayName: String

if let name = firstName {
    displayName = name
} else {
    displayName = username
}
 
 print(displayName)
*/

let displayName = firstName ?? username
// The types need to match on each side of the operator

print(displayName)

/*
 --------------------------------------------
 Final Takeaways for Enums & Optionals Course
 --------------------------------------------

 - Many iOS developers and Objective-C experts were having a tough
 time with optionals and Swift, so don't be disappointed in yourself
 if you don't fully understand why they're useful. We'll build many
 apps together over many different courses, and at each point we'll
 talk about why safety matters.
 
 - We don't have to remember all of this all the time. Here's what
 we need to take away from this course:

 - Enums are pretty important, so get some good practice in.
 - With optionals, understand the concept. Understand that safety
 is a good thing.
 - Try not to use the exclamation mark (bang operator). Though there
 are cases where the system puts those in for you (which happened
 in our last app). We'll go into this more in the future.
 - We should be very familiar with if let and guard.
 - The nil coalescing operator and the pattern matching bits are good
 to be aware of because you might read it in other people's code.
*/
