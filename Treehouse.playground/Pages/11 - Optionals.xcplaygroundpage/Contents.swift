
struct Person {
    let firstName: String
    let middleName: String?
    let lastName: String

    func fullName() -> String {
        if middleName == nil {
            return firstName + " " + lastName
        } else {
            return firstName + " " + middleName! + " " + lastName
        } // Force unwrapping: Don't ever do this
    }

}

let me = Person(firstName: "Pasan", middleName: nil, lastName: "Premaratne")
me.fullName()

/*
 ----------------
 Optional Binding
 ----------------
 
 The safe and correct way to unwrap things.
*/

let airportCodes = ["CDG": "Charles De Gaulle"]
let newYorkAirport = airportCodes["JFK"]

// Optional Binding Using If Let

if let newYorkAirport = airportCodes["JFK"] {
    print(newYorkAirport) // This code will only work if the value is not nil
} else {
    print("Whoops! That key does not exist!")
}

/*
 ---------------------
 Optional Dictionaries
 ---------------------
*/

let weatherDictionary: [String : [String: String]] = [
    "currently" : ["temperature": "22.3"],
    "daily" : ["temperature": "22.3"],
    "weekly" : ["temperature": "22.3"]
]

if let dailyWeather = weatherDictionary["daily"] {
    if let highTemp = dailyWeather["temperature"] {
        print(highTemp)
    }
}

/*
 The problem with this is that we'd have to go several through several
 if let statements to get through all the data. This is what devs call 
 "The Optional Pyramid of Doom," and it's how things worked with Swift 1.
 
 The better solution:
*/

if let dailyWeather = weatherDictionary["daily"], let highTemperature = dailyWeather["temperature"] {
    print(highTemperature) // Each check has to work before the next one is checked
}

/*
 -------------------------
 Downsides to Using If Let
 -------------------------
*/

struct Friend {
    let name: String
    let age: String
    let address: String?
}

func new(friendDictionary: [String: String]) -> Friend? {
    if let name = friendDictionary["name"], let age = friendDictionary["age"] {
        let address = friendDictionary["address"]
        return Friend(name: name, age: age, address: address)
    } else {
        return nil
    }
}

/*
 ----------------------
 Early Exit Using Guard
 ----------------------
 
 - The guard statement below cleans up the code we wrote above.
 - We aren't nesting code; we leave the function early if we don't
 have the values needed.
*/

func newFriend(friendDictionary: [String: String]) -> Friend? {
    guard let name = friendDictionary["name"], let age = friendDictionary["age"] else {
        return nil
    }
    
    let address = friendDictionary["address"]
    
    return Friend(name: name, age: age, address: address)
}


/*
 --------------
 Code Challenge
 --------------
*/

var someValue: Int? = nil

// End of challenge

/*
 --------------
 Code Challenge
 --------------
*/

let movieDictionary = ["Spectre": ["cast": ["Daniel Craig", "Christoph Waltz", "Léa Seydoux", "Ralph Fiennes", "Monica Bellucci", "Naomie Harris"]]]

var leadActor: String = ""

if let movie = movieDictionary["Spectre"],
    let cast = movie["cast"] {
    leadActor = cast[0]
}

// End of challenge

/*
 --------------
 Code Challenge
 --------------
 
*/

struct Book {
    let title: String
    let author: String
    let price: String?
    let pubDate: String?
    
    init?(dict: [String : String]) {
        
        guard let title = dict["title"], let author = dict["author"] else {
            return nil
        }
        
        self.title = title
        self.author = author
        self.price = dict["price"]
        self.pubDate = dict["pubDate"]
    }
}

// End of challenge
