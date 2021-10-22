//
//  MovieDetailTableViewCell.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import UIKit
import Nuke

class MovieDetailTableViewCell: UITableViewCell {

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
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
