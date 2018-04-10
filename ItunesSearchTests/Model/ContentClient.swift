import Foundation

struct ContentClient {
    
    //    MARK: fetching content
    func fetchContent(withTerm term: String, inEntity entity: String, limit: String, completion: @escaping ([Content]?) -> Void)  {
        //    MARK:  endpoint
        let searchEndPoint = ContentEndPoint.search(term: term, entity: entity, limit: limit)
        let searchUrlRequest = searchEndPoint.request
        //    MARK:  network processor
        let networkProcessor = NetworkProcessor(request: searchUrlRequest)
        networkProcessor.downloadJSON { (jsonResponce, httpResponce, error) in
            DispatchQueue.main.async {
                //    MARK:  getting the array of content dictionaries
                guard let json = jsonResponce,
                    let resultDictionaries = json["results"] as? [[String : Any]]
                else { completion(nil)
                       return
                }
               //    MARK: creating an array of content
                let contentArray = resultDictionaries.compactMap({ contentDictionary in
                    return Content(dictionary: contentDictionary)
                })
                completion(contentArray)
            }
            }
        
    }
}
