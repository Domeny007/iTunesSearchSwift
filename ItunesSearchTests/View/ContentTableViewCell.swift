import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var contentUIImageView: UIImageView!
    
    @IBOutlet weak var contentNameUILabel: UILabel!
    
    @IBOutlet weak var contentDescriptionUILabel: UILabel!
    
    @IBOutlet weak var contentPriceUILabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
}
