//
//  Movie.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation

// MARK: - Page
struct Page: Codable {
    var page: Int
    var results: [Movie]
    var totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Article
struct Movie: Codable {
    var firstAirDate: String?
    var backdropPath: String
    var name: String?
    var originalLanguage: String?
    var id: Int
    var originalName: String?
    var originCountry: [String]?
    var voteAverage: Double
    var overview: String
    var voteCount: Int
    var posterPath: String
    var genreIDS: [Int]
    var popularity: Double
    var mediaType: String

    enum CodingKeys: String, CodingKey {
        case firstAirDate = "first_air_date"
        case backdropPath = "backdrop_path"
        case name
        case originalLanguage = "original_language"
        case id
        case originalName = "original_name"
        case originCountry = "origin_country"
        case voteAverage = "vote_average"
        case overview
        case voteCount = "vote_count"
        case posterPath = "poster_path"
        case genreIDS = "genre_ids"
        case popularity
        case mediaType = "media_type"
    }
}
