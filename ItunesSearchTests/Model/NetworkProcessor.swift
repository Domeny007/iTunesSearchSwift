import Foundation
class NetworkProcessor {
    
    let request: URLRequest
    lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session: URLSession = URLSession(configuration: self.configuration)
    typealias JSON = [String : Any]
    typealias JSONHandler = (JSON?, HTTPURLResponse?, Error?) -> Void
    typealias DataHandler = (Data?, HTTPURLResponse?, Error?) -> Void
    
    init(request: URLRequest) {
        self.request = request
    }
    
    //    MARK: downloading JSON function
    func downloadJSON(completion: @escaping JSONHandler)
    {
        let dataTask = session.dataTask(with: self.request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("HTTP Response", comment: "")]
                let error = NSError(domain: NetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                completion(nil, nil, error as Error)
                return
            }
            
            if data == nil {
                if let error = error {
                    completion(nil, httpResponse, error)
                }
            } else {
                switch httpResponse.statusCode {
                case 200:
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                        completion(json, httpResponse, nil)
                    } catch let error as NSError {
                        completion(nil, httpResponse, error)
                    }
                default:
                    print("Received HTTP response code: \(httpResponse.statusCode) - was not handled in NetworkProcessing.swift")
                }
            }
        }
        dataTask.resume()
    }
    //    MARK: downloading Data function
    func downloadData(completion: @escaping DataHandler)
    {
        let dataTask = session.dataTask(with: self.request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                let userInfo = [NSLocalizedDescriptionKey : NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: NetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                completion(nil, nil, error as Error)
                return
            }
            
            if data == nil {
                if let error = error {
                    completion(nil, httpResponse, error)
                }
            } else {
                switch httpResponse.statusCode {
                case 200:
                    completion(data, httpResponse, nil)
                default:
                    print("Received HTTP response code: \(httpResponse.statusCode) - was not handled in NetworkProcessing.swift")
                }
            }
        }
        dataTask.resume()
    }
}
