
// This is a common case where users may not provide all information you ask for

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
}

class Residence {
    var numberOfRooms = 1
    var address: Address?
}

class Person {
    var residence: Residence?
} 

// Meet Susan

let susan = Person()

let address = Address()
address.street = "1234 Something Drive"
address.buildingName = "Building"
address.buildingNumber = "10"

let residence = Residence()
residence.address = address

susan.residence = residence

/*
 -----------------
 Optional Chaining
 -----------------
 
 - If there is incorrect data or no data, this will cause the app
 to "fail gracefully," giving us "nil" rather than crashing.
*/

if let home = susan.residence, let postalAddress = home.address, let buildingNumber = postalAddress.buildingNumber, let convertedNumber = Int(buildingNumber) {
    print(convertedNumber)
} // We have way too many checks here to print a simple address

// Instead, use optional chaining and optional binding to get:
if let buildingNumber = susan.residence?.address?.buildingNumber {
    print(buildingNumber)
}
