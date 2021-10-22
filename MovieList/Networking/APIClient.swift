//
//  APIClient.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation
import Alamofire

class APIClient {
    
    @discardableResult private static func performRequest<T:Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                completion(response.result)
        }
    }
    
    static func getArticles(mediaType: String, timeWindow: String, completion: @escaping (Result<[Movie], AFError>)->Void) {
        let decoder = JSONDecoder()
        performRequest(route: APIRouter.trending(mediaType: mediaType, timeWindow: timeWindow), decoder: decoder, completion: completion)
    }
    
}
