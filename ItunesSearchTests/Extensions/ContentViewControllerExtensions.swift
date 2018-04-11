import Foundation
import UIKit

//    MARK: - ContainerViewContoller SearchBarDelegate extension
extension ContentViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let term = searchBar.text!

        let defaults = UserDefaults.standard
        if let mediaKey = defaults.string(forKey: mediaKey),
            let rowsKey = defaults.string(forKey: numberOfRowsKey),
        
            let mediaSetting = defaults.string(forKey: mediaKey),
            let numberOfRows = defaults.string(forKey: rowsKey){
            mediaString = mediaSetting
            numberOfRowsString = numberOfRows
            contentClient.fetchContent(withTerm: term, inEntity: mediaString!, limit: numberOfRowsString!) { (contentArray) in
                self.contentArray = contentArray
                self.tableView.reloadData()
            }
        }
    }
}



