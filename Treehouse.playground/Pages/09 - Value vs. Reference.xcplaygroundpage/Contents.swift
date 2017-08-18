
/*
 -----------------------------
 Value Type vs. Reference Type
 -----------------------------
 
 A value type is a type whose underlying value is copied when
 it is assigned to a new varaible or constant or when it is 
 passed into a function.
 
 A reference type is not copied when assigned to a new variable
 or contsant or when passed into a function. Rather than a copy,
 a reference to the existing instance is used.
 
 All structs are value types, and all classes are reference types.
 
 When you should use one over the other? It will start to make
 more sense as we get further into it (and it may not make a lot
 of sense now), but it's good to know that value types should be
 used to represent simple data.
 
 Simple rule for now: Use structs to represent simple values
 (like coordinate points). Classes, on the other hand, are better
 at representing more than just value. We will revisit this topic
 several times in the future.
*/

struct User {
    var fullName: String
    var email: String
    var age: Int
}

var someUser = User(fullName: "Amy", email: "amy.martika@gmail.com", age: 26)

var anotherUser = someUser
anotherUser.email

someUser.email = "amdbp7@mail.umkc.edu"
anotherUser.email // Email does not update to reflect change

class Person {
    var fullName: String
    var email: String
    var age: Int
    
    init(name: String, email: String, age: Int) {
        self.fullName = name
        self.email = email
        self.age = age
    }
}

var somePerson = Person(name: "Tim Cook", email: "tim.cook@apple.com", age: 54)
var anotherPerson = somePerson

somePerson.email = "tcook@apple.com"
anotherPerson.email // Email does update to reflect change
