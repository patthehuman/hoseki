//
//  ViewController.swift
//  MovieList
//
//  Created by Patrick Meyer on 10/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    var dataSource: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getTableData()
        
    }
    
    private func getTableData() {
        
        activityIndicator.startAnimating()
        APIClient.getTrending(mediaType: "movie", timeWindow: "week") { result in
            
            self.activityIndicator.stopAnimating()
            
            switch result {
            case .success(let movie):
                
                self.dataSource = movie.results
                
                self.tableView.reloadData()
                
                break
                
            case .failure(let err):
                print(err)
                // TODO: update the UI based on this error
                
                break;
            }
            
        }
    }
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailView = UIStoryboard(name: "Main", bundle: nil)
        let detailController = detailView.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        
        detailController.delegate = self
        detailController.movieId = dataSource[indexPath.row].id
        
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as! MovieListTableViewCell
        
        cell.movie = dataSource[indexPath.row]
        
        return cell
    }
    
}

extension ViewController: MovieDetailDelegate {
    func didUpdateMovie(movie: Movie) {
        
        self.tableView.reloadData()
    }
}
