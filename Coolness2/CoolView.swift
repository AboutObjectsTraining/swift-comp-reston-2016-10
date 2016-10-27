import UIKit

private let textOrigin = CGPoint(x: 8, y: 5)

@IBDesignable
class CoolView: UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayer()
        configureGestureRecognizer()
    }
    
    func configureLayer() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        layer.masksToBounds = true
        sizeToFit()
    }
    
    func configureGestureRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(animateBounce(recognizer:)))
        recognizer.numberOfTapsRequired = 2
        addGestureRecognizer(recognizer)
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
        set { layer.borderColor = newValue.cgColor }
    }
    
    @IBInspectable var text: String? {
        didSet {
            sizeToFit()
        }
    }
    
    @IBInspectable var highlighted: Bool = false {
        didSet {
            alpha = highlighted ? 0.5 : 1.0
        }
    }
}


// MARK: - Animation

extension CoolView
{
    func animateBounce(recognizer: UITapGestureRecognizer)
    {
        animateBounce(size: CGSize(width: 120, height: 240))
    }

    func configureBounceAnimation(size: CGSize) {
        UIView.setAnimationRepeatCount(3.5)
        UIView.setAnimationRepeatAutoreverses(true)
        self.frame = self.frame.offsetBy(dx: size.width, dy: size.height)
        self.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
    }
    
    func configureFinalBounceAnimation(size: CGSize) {
        self.transform = .identity
        self.frame = self.frame.offsetBy(dx: -size.width, dy: -size.height)
    }
    
    func animateFinalBounce(size: CGSize)
    {
        UIView.animate(withDuration: 1) { self.configureFinalBounceAnimation(size: size) }
    }
    
    func animateBounce(size: CGSize)
    {
        UIView.animate(withDuration: 1, animations: { self.configureBounceAnimation(size: size) }) { _ in
            self.animateFinalBounce(size: size)
        }
    }
}


// MARK: - Rendering

extension CoolView
{
    class var defaultTextAttributes: [String: Any] {
        return defaultAppTextAttributes
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text else { return }
        text.draw(at: textOrigin, withAttributes: type(of: self).defaultTextAttributes)
    }
}


// MARK: - Resizing

extension CoolView
{
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text else { return size }
        
        var newSize = text.size(attributes: type(of: self).defaultTextAttributes)
        newSize.width += textOrigin.x * 2
        newSize.height += textOrigin.y * 2
        
        return newSize
    }
}


// MARK: - UIResponder

extension CoolView
{
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
