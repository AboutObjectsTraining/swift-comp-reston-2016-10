import XCTest

class CollectionsTests: XCTestCase {
    func testTuple() {
        let vals = (x: 12, y: 24, z: 99)
        
        let (first, second, _) = vals
        print(first)
        print(second)
        
        let coordinateValuesInCartesianSpace = (xAxisValue: 12.0, yAxisValue: 2.5)
        let (x, y) = coordinateValuesInCartesianSpace
        let area = x * y
        let area2 = coordinateValuesInCartesianSpace.xAxisValue * coordinateValuesInCartesianSpace.yAxisValue
        
        // let foo: (a, b, c)  = vals
    }
}
