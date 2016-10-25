import XCTest
@testable import Shopping

func hey() {
    print("Hey!")
}

class ShoppingTests: XCTestCase
{
    func testFoo() {
        print("Hello, World!")
    }
    
    func testBar() {
        print("Bye!")
    }
    
    func testHey() {
        hey()
    }
}
