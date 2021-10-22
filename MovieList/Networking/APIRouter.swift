//
//  APIRouter.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case trending(mediaType: String, timeWindow: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .trending:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .trending(let meditype, let timeWindow):
            return "/articles/\(meditype)/\(timeWindow)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .trending:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Production.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
