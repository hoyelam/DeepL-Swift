//
//  DeepLAPI.swift
//
//
//  Created by Hoye Lam on 08/08/2022.
//

public protocol DeepLAPICompliant {
    func setAuthenticationToken(_ token: String)
    func translateText(request: TranslationRequest) async throws -> TranslationResponse
}

public final class DeepLAPI: HTTPClient, DeepLAPICompliant {
    
    static var authToken: String = ""
    
    /// Get Authentication from DeepL here
    /// https://www.deepl.com/account
    public init(authToken: String = "") {
        self.setAuthenticationToken(authToken)
    }
    
    /// Get Authentication from DeepL here
    /// https://www.deepl.com/account
    public func setAuthenticationToken(_ token: String) {
        DeepLAPI.authToken = token
    }
}


// MARK: - Functions

extension DeepLAPI {
    public func translateText(request: TranslationRequest) async throws -> TranslationResponse {
        return try await sendRequest(
            endpoint: DeepLAPIEndpoint.translateText(request: request),
            responseModel: TranslationResponse.self
        )
    }
}
