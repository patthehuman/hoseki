//
//  Movies.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import Foundation

// class to handle movie likes/

class Movies {
    
    static func likesMovie(movie: Movie) -> Bool {
        let userLikes = UserDefaults.standard.bool(forKey: "\(movie.id)")
        return userLikes
    }
    
    static func setLikeStatus(likesMovie: Bool, movie: Movie) {
        UserDefaults.standard.set(likesMovie, forKey: "\(movie.id)")
    }
    
}
