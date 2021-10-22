//
//  Constants.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation

struct Constants {
    struct Production {
        static let baseURL = "https://api.themoviedb.org/3"
        static let apiKey = "ac137e7260188e4f782bbccf31c3b2d6"
        static let readAccess = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYzEzN2U3MjYwMTg4ZTRmNzgyYmJjY2YzMWMzYjJkNiIsInN1YiI6IjYxNzMxMDZiMWQwMTkxMDA0NDFlYjBkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OExBP3tVKfrs2odgrRB7gEQyFHpQn9_6dbJqwycmLzo"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
