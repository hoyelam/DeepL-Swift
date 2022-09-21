//
//  HTTPClient.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        guard !DeepLAPI.authToken.isEmpty else {
            throw RequestError.noAuthenticationToken
        }
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        if endpoint.queryItems.count > 0 {
            urlComponents.queryItems = endpoint.queryItems
        }
        
        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        if #available(macOS 12.0, iOS 15.0, *) {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            return try self.handleResponse(data, response, responseModel)
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    guard let data = data else {
                        if let error = error {
                            continuation.resume(throwing: error)
                        }
                        
                        return
                    }
                   
                    do {
                        let result = try self.handleResponse(data, response, responseModel)
                        continuation.resume(returning: result)
                    } catch let error {
                        continuation.resume(throwing: error)
                    }
                }
                
                task.resume()
            }
        }
    }
    
    private func handleResponse<T: Decodable>(_ data: Data,  _ response: URLResponse?, _ responseModel: T.Type) throws -> T {
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }
        switch response.statusCode {
        case 200...299:
            do {
                let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                return decodedResponse
            } catch let error {
                throw RequestError.decode(errorLog: error.localizedDescription)
            }
        case 400:
            throw RequestError.badRequest
        case 403:
            throw RequestError.authorizationFailed
        case 404:
            throw RequestError.resourceNotFound
        case 413:
            throw RequestError.sizeExceedsLimit
        case 414:
            throw RequestError.urlTooLong
        case 429:
            throw RequestError.tooManyRequests
        case 456:
            throw RequestError.quotaExceeded
        case 503:
            throw RequestError.resourceUnavailable
        case 529:
            throw RequestError.tooManyRequests
        case 500...599:
            throw RequestError.internalServerError
        default:
            throw RequestError.unknown
        }
    }
}
