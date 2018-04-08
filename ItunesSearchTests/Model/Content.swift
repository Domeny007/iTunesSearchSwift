import Foundation

struct Content {
    
    var name: String
    var price: Double
    var description: String
    var formattedPrice: String
    var artworkURL: URL?
    var itunesURL: URL?
    
    private struct APIKeys {
        static let name = "trackName"
        static let artworkURL = "artworkUrl512"
        static let description = "description"
        static let formattedPrice = "formatedPrice"
        static let price = "price"
    }
    init?(dictionary: [String : Any]) {
        guard let name = dictionary[APIKeys.name] as? String,
            let artworkURLString = dictionary[APIKeys.artworkURL] as? String,
            let description = dictionary[APIKeys.description] as? String,
            let formattedPrice = dictionary[APIKeys.formattedPrice] as? String,
            let price = dictionary[APIKeys.price] as? Double
        else {return nil}
        
        self.name = name
        self.artworkURL = URL(string: artworkURLString)
        self.description = description
        self.formattedPrice = formattedPrice
        self.price = price
        
    }
}
