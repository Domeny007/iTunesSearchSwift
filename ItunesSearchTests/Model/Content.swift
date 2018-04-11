import Foundation

//    MARK: - dawnloaded content structure
struct Content {
    
    var name: String?
    var price: Double?
    var description: String?
    var formattedPrice: String?
    var artworkURL: URL?
    var itunesURL: URL?
    
    //    MARK: - api keys structure
    private struct APIKeys {
        static let name = "trackName"
        static let artworkURL = "artworkUrl60"
        static let description = "description"
        static let formattedPrice = "formattedPrice"
        static let price = "price"
        static let itunesUrl = "trackViewUrl"
    }
    init?(dictionary: [String : Any]) {
            let name = dictionary[APIKeys.name] as? String
            let artworkURLString = dictionary[APIKeys.artworkURL] as? String
            let description = dictionary[APIKeys.description] as? String
            let formattedPrice = dictionary[APIKeys.formattedPrice] as? String
            let price = dictionary[APIKeys.price] as? Double
            let itunesUrl = dictionary[APIKeys.itunesUrl] as? String
        
        if name == nil { self.name = "Dont have name" } else { self.name = name }
        if description == nil { self.description = "Dont have description" } else { self.description = description }
        if formattedPrice == nil { self.formattedPrice = "Dont have price" } else { self.formattedPrice = formattedPrice }
        if price == nil { self.price = -1 } else { self.price = price
        }
        self.artworkURL = URL(string: artworkURLString!)
        self.itunesURL = URL(string: itunesUrl!)
    }
    
}
