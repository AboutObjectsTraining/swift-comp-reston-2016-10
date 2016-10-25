import UIKit

class CoolViewController: UIViewController
{
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .brown
        
        let view1 = CoolView(frame: CGRect(x: 20, y: 40, width: 80, height: 30))
        let view2 = CoolView(frame: CGRect(x: 50, y: 90, width: 80, height: 30))
        
        view1.text = "Hello, World!"
        view2.text = "The race is to the Swift."
        
        view.addSubview(view1)
        view.addSubview(view2)
        
        view1.backgroundColor = .purple
        view2.backgroundColor = .orange
    }
}

// MARK: - UIResponder Methods

extension CoolViewController
{
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("In touchesBegan...")
//    }
/*
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let touchedView = touch.view else {
            return
        }
        let location = touch.location(in: touchedView.superview)
        touchedView.center = location
    }
 */
}
