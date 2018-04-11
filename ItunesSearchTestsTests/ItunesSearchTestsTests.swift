import XCTest
@testable import ItunesSearchTests
class ItunesSearchTestsTests: XCTestCase {
    
    var contentViewConntrollerMock: ContentViewController!
    var contentClientMock: ContentClient!
    var networkProcessorMock: NetworkProcessor!
    var contentArray: [Content]?
    
    override func setUp() {
        super.setUp()
        contentViewConntrollerMock = ContentViewController()
        contentClientMock = ContentClient()
    }
    
    override func tearDown() {
        contentViewConntrollerMock = nil
        super.tearDown()
    }
    
    func testInitContentTableView() {
        //given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let testableVC = storyboard.instantiateViewController(withIdentifier: "SearchVC") as! ContentViewController

        //when
        _ = testableVC.view
        
        //then
        XCTAssertNotNil(testableVC.tableView)
    }
    func testShowSearchView() {
        //given
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let testableVC = storyboard.instantiateViewController(withIdentifier: "SearchVC") as! ContentViewController
        //when
        _ = testableVC.view
        testableVC.createSearchViewController()
        //then
        XCTAssertNotNil(testableVC.searchController)
    }
    func testDownloadingData() {
        //given
        let url = URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Video/v4/e0/57/fb/e057fb31-73b9-f79a-11ab-83757b653efb/source/60x60bb.jpg")
        let request = URLRequest(url: url!)
        let expect = expectation(description: "Testing getting data")
        
        networkProcessorMock = NetworkProcessor(request: request)
        //when
        networkProcessorMock.downloadData { (data, responce, error) in
            DispatchQueue.main.async {
                
                if (error != nil) || (data == nil) {
                    XCTFail("error: \(String(describing: error))")
                }
                expect.fulfill()
            }
        }
        //then
        waitForExpectations(timeout: 0.1) { (error) in
            if let error = error {
                XCTFail("Error: \(error)")
            }
        }
    }
    func testFetchingData() {
        //given
        let term = "k"
        let entity = "music"
        let limit = "2"
        let expect = expectation(description: "Fetching test")
        
        //when
        contentClientMock.fetchContent(withTerm: term, inEntity: entity, limit: limit) { (contentArray) in
            self.contentArray = contentArray
            if contentArray == nil {
                XCTFail("Fail")
            }
            expect.fulfill()
        }
        //then
        waitForExpectations(timeout: 10.0) { (error) in
            if error != nil {
                XCTFail("error: \(String(describing: error))")
            }
        }
    }

}
