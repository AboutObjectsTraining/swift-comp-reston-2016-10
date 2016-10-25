import UIKit

let defaultAppTextAttributes: [String: Any] = [
    NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18)
]


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication)
    {
        let frameRect = UIScreen.main.bounds
        window = UIWindow(frame: frameRect)
        window?.backgroundColor = .lightGray
        window?.rootViewController = CoolViewController()
        
        window?.makeKeyAndVisible()
    }
}

