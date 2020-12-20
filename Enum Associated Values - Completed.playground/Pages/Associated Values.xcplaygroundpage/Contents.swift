/*:
 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)

 ## Associated Values
This set of code blocks will introduced the concept of Associated Values for enums

*/
code(for: "Example 1: Associated Type") {
    enum Car:String {
        case convertable = "Car with no top"
        case suv
        case sedan
    }
    let car = Car.suv
    print(car)
    print(car.rawValue.uppercased())
    let car2 = Car.convertable
    print(car2)
    print(car2.rawValue)
    
}

code(for: "Example 2: Associated Type 2") {
    enum Car:Double {
        case convertable = 53900
        case suv = 38015
        case sedan = 20000
    }
    let car = Car.suv
    print(car)
    print(car.rawValue)
}

code(for: "Example 3: Associated Values") {
    enum Car {
        case convertable(price: Double)
        case suv(price: Double)
        case sedan(price: Double)
        
        var price:Double {
            switch self {
            case .convertable(price: let price):
                return price
            case .suv(price: let price):
                return price
            case .sedan(price: let price):
                return price
            }
        }
        
        var description: String {
            switch self {
            case .convertable:
                return "Convertable"
            case .suv:
                return "SUV"
            case .sedan:
                return "Sedan"
            }
        }
    }
    let car = Car.convertable(price: 5600)
    print(car)
    print(car.price)
    print(car.description)
   
}

code(for: "Example 4: Different Associated Values") {
    enum Size {
        case small, medium, large
    }
    
    enum MenuItem {
        case coke(size: Size)
        case burger(quantity: Int)
        case fries(size: Size)
    }
    
    let order1:[MenuItem] = [
        MenuItem.coke(size: .small),
        MenuItem.burger(quantity: 2),
        MenuItem.fries(size: .large)
    ]
    
    func printOrder(_ order: [MenuItem]) {
        for item in order {
            switch item {
            case .coke(size: let size):
                print("\(size) coke")
            case .burger(quantity: let quantity):
                print("\(quantity) burgers")
            case .fries(size: let size):
                print("\(size) fries")
            }
        }
    }
    
    printOrder(order1)

}

/*:

 [< Previous](@previous)           [Home](Introduction)           [Next >](@next)
 */
