
/*
 ------------
 Type Casting
 ------------
*/

class Employee {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class HourlyEmployee: Employee {
    let hourlyWage: Double
    
    init(name: String, hourlyWage: Double) {
        self.hourlyWage = hourlyWage
        super.init(name: name)
    }
    
    func payWages(for hours: Double) -> Double {
        return hourlyWage * hours
    }
}

class SalariedEmployee: Employee {
    let salary: Double
    
    init(name: String, salary: Double) {
        self.salary = salary
        super.init(name: name)
    }
    
    func paySalary() -> Double {
        return salary/24
    }
}

let hourlyEmployee = HourlyEmployee(name: "Taylor", hourlyWage: 12.00)
let salariedEmployee = SalariedEmployee(name: "Lorenzo", salary: 62000)

let employees = [hourlyEmployee, salariedEmployee]
// Both types are cast to the Employee type, allowing them to be in the same array

/*
 -----------------
 Downcast Operator
 -----------------
 
 - as? is the conditional form. The traditional form. It will return
 an optional if it succeeds or nil if it fails.
 - as! is the forced form. It should only be used when you know
 the downcast will succeed. Otherwise the app will crash.
*/

for employee in employees {
    if employee is HourlyEmployee {
        let HourlyEmployee = employee as! HourlyEmployee
        hourlyEmployee.payWages(for: 10.00)
    }
    
    if employee is SalariedEmployee {
        let SalariedEmployee = employee as! SalariedEmployee
        salariedEmployee.paySalary()
    }
}
