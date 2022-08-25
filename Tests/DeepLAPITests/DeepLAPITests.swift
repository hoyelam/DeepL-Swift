import XCTest
@testable import DeepLAPI

final class DeepLAPITests: XCTestCase {
    let testToken = "<INSERT YOUR AUTH-TOKEN HERE>"
    
    func testTranslateText() async throws {
        // Given
        let sut = DeepLAPI(authToken: testToken)
        let request = TranslationRequest(
            text: "Hello World!",
            sourceLanguage: .english,
            targetLanguage: .dutch
        )
        
        // Then
        do {
            let result = try await sut.translateText(request: request)
            
            XCTAssertNoThrow(result)
        } catch let error {
            XCTFail("Error when translation text with DeepL API: \(error)")
        }
    }
}
