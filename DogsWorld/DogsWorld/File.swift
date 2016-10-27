import Foundation


class Animal {
    
}

class Dog: Animal, CustomStringConvertible {
    
    static var dogs = [Dog]()
    
    class func bark() {
        print("Woof, woof!")
    }
    
    class func dog(name: String) -> Dog? {
        for dog in dogs where dog.name == name {
            print("Class: \(type(of: self)), dog: \(dog)")
            self.bark()
            return dog
        }
        return nil
    }
    
    var name = ""
    var breed = ""
    var description: String { return name }
    
    @discardableResult
    convenience init(name: String) {
        self.init(name: name, breed: "")
    }
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
        super.init()
        
        Dog.dogs.append(self)
    }
}
