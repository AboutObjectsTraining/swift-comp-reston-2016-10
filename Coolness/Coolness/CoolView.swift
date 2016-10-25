import UIKit

private let textOrigin = CGPoint(x: 8, y: 5)


class CoolView: UIView
{
    var highlighted: Bool = false {
        didSet {
            alpha = highlighted ? 0.5 : 1.0
        }
    }
    
    class var defaultTextAttributes: [String: Any] {
        return defaultAppTextAttributes
    }
    
    var text: String?
    
    override func draw(_ rect: CGRect)
    {
        guard let text = text else { return }
        
        text.draw(at: textOrigin, withAttributes: type(of: self).defaultTextAttributes)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.bringSubview(toFront: self)
        highlighted = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        guard let touch = touches.first else { return }
        
        let currLocation = touch.location(in: self)
        let prevLocation = touch.previousLocation(in: self)
        
        center.x += currLocation.x - prevLocation.x
        center.y += currLocation.y - prevLocation.y
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
}
