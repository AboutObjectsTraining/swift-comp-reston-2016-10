import UIKit

private let accessoryHeight = CGFloat(90)

class CoolViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet var contentView: UIView!
    @IBOutlet var textField: UITextField!
    
    @IBAction func addCoolView() {
        let newCoolView = CoolView()
        newCoolView.text = textField.text
        contentView.addSubview(newCoolView)
        newCoolView.sizeToFit()
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func loadView3() {
        Bundle.main.loadNibNamed("CoolStuff", owner: self, options: nil)
    }
    
    func loadView2()
    {
        let topLevelObjs = Bundle.main.loadNibNamed("CoolStuff", owner: nil, options: nil)
        guard let backgroundView = topLevelObjs?.first as? UIView else { return }
        view = backgroundView
    }
    
    func loadView1() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .brown
        
        let accessoryView = UIView(frame: CGRect(origin: view.frame.origin,
                                                 size: CGSize(width: view.frame.width,
                                                              height: accessoryHeight)))
        contentView = UIView(frame: CGRect(x: view.frame.minX,
                                           y: accessoryHeight,
                                           width: view.frame.width,
                                           height: view.frame.height - accessoryHeight))
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        contentView.clipsToBounds = true
        
        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.8)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        textField = UITextField(frame: CGRect(x: 15, y: 35, width: 220, height: 30))
        accessoryView.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter some text"
        
        textField.delegate = self
        
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 250, dy: 35)
        
        button.addTarget(self, action: #selector(addCoolView), for: UIControlEvents.touchUpInside)
        
        accessoryView.addSubview(button)
        
        
        configureCoolViews()
    }
    
    func configureCoolViews()
    {
        let view1 = CoolView(frame: CGRect(x: 20, y: 40, width: 80, height: 30))
        let view2 = CoolView(frame: CGRect(x: 50, y: 90, width: 80, height: 30))
        
        view1.text = "Hello, World!"
        view2.text = "The race is to the Swift."
        
        view1.sizeToFit()
        view2.sizeToFit()
        
        contentView.addSubview(view1)
        contentView.addSubview(view2)
        
        view1.backgroundColor = .purple
        view2.backgroundColor = .orange
    }
}

// MARK: - UIResponder Methods

//extension CoolViewController
//{
////    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        print("In touchesBegan...")
////    }
///*
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first, let touchedView = touch.view else {
//            return
//        }
//        let location = touch.location(in: touchedView.superview)
//        touchedView.center = location
//    }
// */
//}
