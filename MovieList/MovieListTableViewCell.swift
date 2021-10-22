//
//  MovieListTableViewCell.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import UIKit
import Nuke

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    public var movie: Movie! {
        didSet {
            styleCell()
        }
    }
    
    private func styleCell() {
    
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
