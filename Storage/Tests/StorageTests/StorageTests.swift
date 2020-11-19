import XCTest
@testable import Storage

final class StorageTests: XCTestCase {
    func testThatEngineWorks() {
        
        let identifier = "test"
        
        Storage.engine.save(key: identifier, content: identifier)
        
        let saved = Storage.engine.get(key: identifier)
        XCTAssertEqual(saved, identifier)
        
        Storage.engine.delete(key: identifier)
        
        XCTAssertNil(Storage.engine.get(key: identifier))
    }

    static var allTests = [
        ("testThatEngineWorks", testThatEngineWorks),
    ]
}
