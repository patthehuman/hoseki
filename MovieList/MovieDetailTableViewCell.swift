//
//  MovieDetailTableViewCell.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import UIKit
import Nuke

protocol MovieDetailCellDelegate: AnyObject {
    func didUpdateMovie(movie: Movie)
}

class MovieDetailTableViewCell: UITableViewCell {

    var delegate: MovieDetailCellDelegate?
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieLikeButton: UIButton!
    
    public var movie: Movie! {
        didSet {
            styleCell()
        }
    }
    
    private func styleCell() {
    
        movieTitle.text = movie.originalName
        movieDescription.text = movie.name
        
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "AppIcon"),
            transition: .fadeIn(duration: 0.33)
        )
        
        // generate a url path
        // TODO: abstract this base url
        let path = "https://www.themoviedb.org/t/p/w220_and_h330_face/" + movie.posterPath
        
        Nuke.loadImage(with: path, options: options, into: movieImage)
        
        determineLike()
        
    }
    
    private func determineLike() {
        // check if we like this movie
        var imageState = UIImage(systemName: "heart")
        if Movies.likesMovie(movie: movie) {
            imageState = UIImage(systemName: "heart.fill")
        }
        
        movieLikeButton.setImage(imageState, for: .normal)
        
    }
    
    @IBAction func selectedHeart(_ sender: Any) {
        
        let currentLike = Movies.likesMovie(movie: movie)
        
        Movies.setLikeStatus(likesMovie: !currentLike, movie: movie)
        
        determineLike()
     
        // pass movie along in case the data source is updated to reflect movie like state?
        delegate?.didUpdateMovie(movie: movie)
        
    }

}
