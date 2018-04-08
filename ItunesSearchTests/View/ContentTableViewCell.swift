import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var contentUIImageView: UIImageView!
    @IBOutlet weak var contentNameUILabel: UILabel!
    @IBOutlet weak var contentDescriptionUILabel: UILabel!
    @IBOutlet weak var contentPriceUILabel: UILabel!
    
    var content: Content! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        contentNameUILabel.text = content.name
        contentDescriptionUILabel.text = content.description
        
        if content.price == 0 {
            contentPriceUILabel.text = content.formattedPrice
        } else {
            contentPriceUILabel.text = "$\(content.price)"
        }
        self.contentUIImageView.image = nil
        if let url = content.artworkURL {
            let request = URLRequest(url: url)
            let networkProcessor = NetworkProcessor(request: request)
            
            networkProcessor.downloadData { (data, responce, error) in
                DispatchQueue.main.async {
                    if let imageData = data {
                        self.contentUIImageView.image = UIImage(data: imageData)
                        self.contentUIImageView.layer.cornerRadius = 10.0
                        self.contentUIImageView.layer.masksToBounds = true
                    }
                }
            }
        }
    }
    
}
