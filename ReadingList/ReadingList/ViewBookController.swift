import UIKit

extension UIStoryboardSegue
{
    var targetViewController: UIViewController {
        guard let navController = destination as? UINavigationController,
            let controller = navController.viewControllers.first else
        {
            return destination
        }
        
        return controller
    }
}

class ViewBookController: UITableViewController
{
    var book: Book!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshUI()
    }
    
    func refreshUI() {
        titleLabel.text = book.title
        yearLabel.text = book.year
        firstNameLabel.text = book.author?.firstName
        lastNameLabel.text = book.author?.lastName
    }
    
    
    @IBAction func cancelEditingBook(segue: UIStoryboardSegue) {
        // Intentionally left blank.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.targetViewController as? EditBookController else {
            fatalError("Unable to downcast destination view controller")
        }
        
        controller.book = book
    }
}
