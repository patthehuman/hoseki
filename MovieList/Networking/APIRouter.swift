//
//  APIRouter.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case movie(id: Int)
    case trending(mediaType: String, timeWindow: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .trending:
            return .get
        case .movie:
            return .get
        }
    
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .trending(let meditype, let timeWindow):
            return "/trending/\(meditype)/\(timeWindow)"
        case .movie(let id):
            return "/movie/\(id)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .trending, .movie:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url = try Constants.Production.baseURL.asURL()
        
        // It looks like the movie api requires api_key to be appended to every url
        let queryItems = [URLQueryItem(name: "api_key", value: Constants.Production.apiKey)]
        url = url.appending(queryItems)!
        
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


