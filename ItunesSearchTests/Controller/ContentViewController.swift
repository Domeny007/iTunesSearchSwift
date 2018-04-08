import UIKit

class ContentViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var contentArray: [Content]?
    var contentClient = ContentClient()
    
    let contentCellIdentifier = "contentCellIdentefier"
    let contentNibName =  "ContentTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        fetchContent()
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func fetchContent() {
        contentClient.fetchContent(withTerm: "instagram", inEntity: "software") { (contentArray) in
            self.contentArray = contentArray
            self.tableView.reloadData()
        }
    }
    
    func registerCell() {
        let nib = UINib(nibName: contentNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: contentCellIdentifier)
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let contentArray = contentArray {
            return contentArray.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contentCellIdentifier, for: indexPath) as! ContentTableViewCell
        cell.content = contentArray?[indexPath.row]
        cell.selectionStyle = .blue
        return cell
        
    }

}
