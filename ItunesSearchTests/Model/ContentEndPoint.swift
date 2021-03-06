import Foundation


//    MARK: end point enum
enum ContentEndPoint {
    
    case search(term: String, entity: String, limit: String)
    
    var request: URLRequest {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryComponents
        
        let url = components?.url
        return URLRequest(url: url!)
        
        
    }
    private var baseURL: String {
        return "https://itunes.apple.com/"
    }
    private var path: String {
        switch self {
        case .search: return "/search"
        }
    }
    private struct ParameterKeys {
        static let country = "country"
        static var term = "term"
        static let entity = "media"
        static let limit = "limit"
    }
    
    private struct DefaultValues {
        static let country = "us"
        static let term = "apple"
    }
    var parameters: [String: Any] {
        switch self {
        case .search(let term, let entity, let limit):
            let parameters: [String: Any] = [
                ParameterKeys.term    : term,
                ParameterKeys.country : DefaultValues.country,
                ParameterKeys.entity  : entity,
                ParameterKeys.limit   : limit
            ]
            return parameters
        }
    }
    
    private var queryComponents: [URLQueryItem] {
        var components = [URLQueryItem]()
        
        for (key,value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.append(queryItem)
            
        }
        return components
    }
    
}
