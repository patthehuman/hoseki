//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import UIKit

protocol MovieDetailDelegate: AnyObject {
    func didUpdateMovie(movie: Movie)
}

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: MovieDetailDelegate?
    
    public var movieId: Int!
    private var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupTableView()
        getMovieById()
        
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getMovieById() {
        
        activityIndicator.startAnimating()
        
        APIClient.getMovie(id: movieId) { res in
            
            self.activityIndicator.stopAnimating()
            
            switch res {
            case .success(let movie):
                self.movie = movie
                break
                
            case .failure(let err):
                // do something with erro
                print(err)
                break
            }
        }
    }
    

}
 

extension MovieDetailViewController: UITableViewDelegate {
    
}

extension MovieDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let m = movie else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailTableViewCell", for: indexPath) as! MovieDetailTableViewCell
        
        cell.delegate = self
        cell.movie = m
        
        return cell
    }
    
}


extension MovieDetailViewController: MovieDetailCellDelegate {
    func didUpdateMovie(movie: Movie) {
        delegate?.didUpdateMovie(movie: movie)
    }
}
