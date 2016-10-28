import UIKit

class ReadingListController: UITableViewController
{
    var store = ReadingListStore("BooksAndAuthors")
    
    lazy var readingList: ReadingList = self.store.fetchReadingList()
}


extension ReadingListController
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let controller = segue.destination as? ViewBookController,
            let indexPath = tableView.indexPathForSelectedRow else { return }
        
        controller.book = readingList.books[indexPath.row]
    }
}


// MARK: Action methods

extension ReadingListController
{
    @IBAction func doneEditingBook(segue: UIStoryboardSegue) {
        store.saveReadingList(readingList)
        tableView.reloadData()
    }
}


// MARK: UITableViewDataSource

extension ReadingListController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let myCell = tableView.dequeueReusableCell(withIdentifier: "book") else {
            fatalError("Unable to dequeue a 'book' cell. Check the cell identifier in the storyboard.")
        }
        
        let book = readingList.books[indexPath.row]
        myCell.textLabel?.text = book.title
        myCell.detailTextLabel?.text = "\(book.year ?? "----")  \(book.author?.fullName ?? "")"
        myCell.imageView?.image = UIImage(named: book.author?.lastName ?? "NoImage")
        
        return myCell
    }
}
