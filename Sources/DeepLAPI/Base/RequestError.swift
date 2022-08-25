//
//  RequestError.swift
//  
//
//  Created by Hoye Lam on 25/08/2022.
//

import Foundation

public enum RequestError: Error {
    case noAuthenticationToken
    
    case invalidURL
    case noResponse
    case badRequest
    case decode(errorLog: String)
    
    case authorizationFailed
    case resourceNotFound
    case sizeExceedsLimit
    case urlTooLong
    case tooManyRequests
    case quotaExceeded
    case resourceUnavailable
    case internalServerError
    case unknown
    
    var customMessage: String {
        switch self {
        case .noAuthenticationToken:
            return "No authentication token provided"
        case .invalidURL:
            return "Invalud URL"
        case .noResponse:
            return "Server is not responding"
        case .badRequest:
            return "Bad request. Please check error message and your parameters."
        case .decode(let errorLog):
            return "Decode error: \(errorLog)"
        case .authorizationFailed:
            return "Authorization failed. Please supply a valid auth_key parameter."
        case .resourceNotFound:
            return "The requested resource could not be found."
        case .sizeExceedsLimit:
            return "The request size exceeds the limit."
        case .urlTooLong:
            return "The request URL is too long. You can avoid this error by using a POST request instead of a GET request, and sending the parameters in the HTTP body."
        case .tooManyRequests:
            return "Too many requests. Please wait and resend your request."
        case .quotaExceeded:
            return "Quota exceeded. The character limit has been reached."
        case .resourceUnavailable:
            return "Resource currently unavailable. Try again later."
        case .internalServerError:
            return "Internal error"
        case .unknown:
            return "Unknown error"
        }
    }
}
