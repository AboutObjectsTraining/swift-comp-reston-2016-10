import XCTest
@testable import DogsWorld

class DogsWorldTests: XCTestCase {
    
    func testDogWithName() {
        Dog(name: "Rover")
        Dog(name: "Fido")
        Dog(name: "Spot")
        let fido = Dog.dog(name: "Fido")
        let spot = Dog.dog(name: "Spot")
        
        guard let dog1 = fido, let dog2 = spot, dog1.breed == "" else {
            return
        }
        
        if let dog = fido {
            print(dog)
        }
        
        print(dog1)
        print(dog2)
        
        print(fido!)
    }
    
    func testDogs() {
        Dog(name: "Rover")
        Dog(name: "Fido")
        Dog(name: "Spot")
        
        print(Dog.dogs)
    }
}
