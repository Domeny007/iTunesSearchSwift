import Foundation

struct ContentClient {
    
    func fetchContent(withTerm term: String, inEntity entity: String, completion: @escaping ([Content]?) -> Void)  {

        // 1. endpoint
        let searchEndPoint = ContentEndPoint.search(term: term, entity: entity)
        let searchUrlRequest = searchEndPoint.request
        // 2. network processor
        let networkProcessor = NetworkProcessor(request: searchUrlRequest)
        networkProcessor.downloadJSON { (jsonResponce, httpResponce, error) in
            
            DispatchQueue.main.async {
                
                // 3. get the array of content dictionaries
                guard let json = jsonResponce,
                    let resultDictionaries = json["results"] as? [[String : Any]]
                else { completion(nil)
                       return
                }
                
                // 4. create an array of content
                let contentArray = resultDictionaries.compactMap({ contentDictionary in
                    return Content(dictionary: contentDictionary)
                })
                // 5. call completion
                completion(contentArray)
            }
            }
        
    }
}
