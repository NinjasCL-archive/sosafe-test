import XCTest
@testable import API

final class APITests: XCTestCase {
    func testThatGoogleNearbyQueryReturnResults() {
       let timeout : TimeInterval = 10
        
       let expectation = XCTestExpectation(description: "Search Nearby Locations")
        
       // Search for tenis in Santiago
       let params = API.GooglePlacesNearbyQuerySearchParams("Tenis", latitude: -33.4594048, longitude: -70.6576384)

        API.Google.place.nearby(params, success: { (response) in
            
            XCTAssert(response.results!.count > 0, "Results should be greater than zero")
            
            expectation.fulfill()
            
        }, error: {
            XCTAssert(false, "Search should return results")
            expectation.fulfill()
        })
        
        wait(for: [expectation], timeout: timeout)
    }

    static var allTests = [
        ("testThatGoogleNearbyQueryReturnResults", testThatGoogleNearbyQueryReturnResults),
    ]
}
