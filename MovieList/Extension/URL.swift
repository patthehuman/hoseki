//
//  URL.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation

extension URL {

    func appending(_ queryItems: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems

        return urlComponents.url
    }
    
}
