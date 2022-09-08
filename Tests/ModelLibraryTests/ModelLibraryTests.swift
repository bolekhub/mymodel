import XCTest
@testable import ModelLibrary

final class ModelLibraryTests: XCTestCase {
    let httpURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"

    func test_http_string_to_secureScheme_conversion_ok() {
        let URL = URL(string: httpURL.asSecureURL()!)
        XCTAssert(URL?.scheme == "https")
    }
    
    func test_http_string_to_secureScheme_conversion_with_already_secured_scheme() {
        let URL = URL(string: httpURL.asSecureURL()!)
        XCTAssert(URL?.scheme == "https")
    }
}
