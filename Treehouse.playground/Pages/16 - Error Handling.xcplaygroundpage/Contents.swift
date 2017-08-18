
/*
 ---------------
 Types of Errors
 ---------------
 
 * Domain Errors *
 - For instance, we could ask customers to input weight
 or distance into an app. This data may be input as a string
 in a text field. We would set an acceptable range of values
 (or the domain). If the user put in a value that is outside
 that acceptable range, we call this a domain error.
 - Swift views these types of errors as simple errors, where
 halting the program execution is a little over the top. Swift
 deals with domain errors by using optionals, returning nil in
 the case of a domain error.
 - From there, we can use constructs like guard, if let, and 
 optional changing to handle that nil value appropriately and
 continue our program execution.
 - Both incorrect input and nonexistent data raise domain errors.
 
 * Compiler Errors *
 - Errors that the Swift compiler raises as it parses your code
 and prevents it from running. Domain errors can be considered
 compiler errors in Swift in some cases.
 
 * Runtime Errors *
 - Errors that the compiler cannot catch and only occur when
 you run your program and hit a particular line of code.
 - We can react to them in two ways depending on what kind of
 error occured: a recoverable error and unrecoverable errors
 (or failures).
 
 * Unrecoverable Errors *
 - First type: Logic Errors. Occur from a programmer's mistake.
 - Second type: Universal Errors. We cannot anticipate the
 error occurring.
 - Neither of these can be guarded against, so the app will
 typically crash in these occasions.
 
*/

/*
 ---------------
 Modeling Errors
 ---------------
 
 - Adding throws tells the compiler that an error can occur 
 inside this function.
 - A funciton or method cannot throw an erorr unless explicitly
 indicated using the throws keyword.
 - The throws keword is always added in the function declaration,
 after the parameter list and before the return type.
 - Throw keyword always take an argument.
 - If a function is not indicated to be a throwing one, trying to 
 throw an error from within leads to a compiler error.
*/

struct Friend {
    let name: String
    let age: String
    let address: String?
}

enum FriendError: Error {
    case invalidData(description: String)
    case someError
}

func friend(from dict: [String : String]) throws -> Friend { // Returning a non-optional type can raise a recoverable error
    guard let name = dict["name"] else {
        throw FriendError.invalidData(description: "Invalid name value")
    } // If you hit a throw statement, you exit the function
    
    guard let age = dict["age"] else {
        throw FriendError.invalidData(description: "Invalid age value")
    }
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
    // We've anticipated that an error can occur inside this function when data is missing
}

func send(message: String, to friend: Friend) {} // We want to send a message to a friend
// For this to succeed, we have to successfully create an instance of friend

let response = ["name": "Pasan", "ag": "28", "address": "someAddress"]

do {
    let myFriend = try friend(from: response)
    send(message: "Test", to: myFriend)
} catch FriendError.invalidData(let description) { // Catching a specific error
    // Inform the user that they passed in invalidData
    print(description)
} catch FriendError.someError {
    
}

/*
 --------------
 Code Challenge
 --------------
*/

enum NetworkError: Error {
    case invalidURL
}

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

enum BookError: Error {
    case incorrectTitle
}

func lend() throws {
    throw BookError.incorrectTitle
}

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

enum ParserError: Error {
    case emptyDictionary
    case invalidKey
}

struct Parser {
    var data: [String : String?]?
    
    func parse() throws {
        guard let parseData = data else {
            throw ParserError.emptyDictionary
        }
        
        guard parseData.keys.contains("someKey") else {
            throw ParserError.invalidKey
        }
    }
}

let data: [String : String?]? = ["someKey": nil]
let parser = Parser(data: data)

do {
    try Parser(data: data).parse()
} catch {
    print("Error!")
}

// End of challenge
