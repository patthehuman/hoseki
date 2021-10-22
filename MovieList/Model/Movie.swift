//
//  Movie.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation

// MARK: - Article
struct Movie: Codable {
    
    var id: Int
   
    enum CodingKeys: String, CodingKey {
        case id
    }
    
}
