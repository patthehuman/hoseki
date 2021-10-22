//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    public var movieId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

}
