import XCTest
@testable import Shared

final class SharedTests: XCTestCase {
    func testThatLoggerExists() {
        XCTAssertNotNil(Shared.log)
        let message = "Logger Test Completed"
        Shared.log.trace("\(message)")
    }
    
    func testThatEnvironmentExists() {
        XCTAssertNotNil(Shared.env)
        XCTAssertEqual(Shared.env.current(), Shared.EnvironmentType.testing)
    }

    static var allTests = [
        ("testThatLoggerExists", testThatLoggerExists),
    ]
}
