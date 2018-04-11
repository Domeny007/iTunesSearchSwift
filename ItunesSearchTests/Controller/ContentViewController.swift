import UIKit
import SafariServices
class ContentViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var contentArray: [Content]?
    var contentClient = ContentClient()
    let contentCellIdentifier = "contentCellIdentefier"
    let contentNibName =  "ContentTableViewCell"
    var searchController = UISearchController(searchResultsController: nil)
    var resultControllet = UIViewController()
    var mediaString: String?
    var numberOfRowsString: String?
    var webViewController:SFSafariViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        prepareTableView()
        createSearchViewController()
    }
    
 //    MARK: Preparing TableView
    func prepareTableView() {
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    //    MARK: - Creating UISearchViewController
    func createSearchViewController() {
        searchController.searchBar.delegate = self
        tableView.tableHeaderView = self.searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    //    MARK: - registration of cell
    func registerCell() {
        let nib = UINib(nibName: contentNibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: contentCellIdentifier)
    }
    
    
    // MARK: - Table view data source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if contentArray != nil {
            let contentArray = self.contentArray
            return contentArray!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contentCellIdentifier, for: indexPath) as! ContentTableViewCell
        if tableView == self.tableView {
             cell.content = contentArray?[indexPath.row]
        }
       
        cell.selectionStyle = .blue
        return cell
    }
    //    MARK: - 
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = contentArray?[indexPath.row]
        guard let url = content?.itunesURL else {return}
        self.showContentsWebSite(with: url)
        print(url)
        
    }
    func showContentsWebSite(with url: URL) {
        webViewController = SFSafariViewController(url: url)
        present(webViewController, animated: true, completion: nil)
        
    }
}
