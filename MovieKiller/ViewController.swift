//
//  ViewController.swift
//  MovieKiller
//
//  Created by Felix and George on 04/11/2021.
//


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var url = URL(string: "https://www.omdbapi.com/?s=Movie&page=1&apikey=e238f827")
    
    @IBAction func searchButton(_ sender: Any) {
        let input = self.searchInput.text
        let value = "Movie"
        url = URL(string: "https://www.omdbapi.com/?s=\(input ?? value)&page=1&apikey=e238f827")
        getMovies(url: url)
    }
    @IBOutlet weak var searchInput: UITextField!

    @IBOutlet weak var myTableView: UITableView!
    
    var search : Search?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        getMovies(url: self.url)
              
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let search = self.search {
            return search.movie.count
        }
         return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController
        if let secondViewController = secondViewController{
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let myCell = self.myTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell {
            if let search = self.search{
                myCell.myMovieLabel.text = search.movie[indexPath.row].title
                myCell.myMovieYear.text = search.movie[indexPath.row].year
                myCell.myMovieImage.imageFromUrl(url: search.movie[indexPath.row].poster)
                return myCell
            }
        }
        return UITableViewCell()
    }
    
    func getMovies( url : URL? ){
        if let url = url {
            URLSession.shared.dataTask(with: url) {data,_,error in
                if let error = error {
                    print("Error occured : \(error)")
                }
                if let data = data {
                    do{
                        let decoder = JSONDecoder()
                        self.search = try decoder.decode(Search.self, from: data)
                        DispatchQueue.main.async {
                            self.myTableView.reloadData()
                        }
                    }catch let error {
                        print("Unknown Error : \(error)")
                    }
                }
            }.resume()
        }
    }
}

extension UIImageView {
    public func imageFromUrl(url: URL?) {
        if let url = url {
            URLSession.shared.dataTask(with: url) {data,_,error in
                if let error = error {
                    print("Error occured : \(error)")
                }
                if let data = data {
                    if let imageData = data as Data? {
                        DispatchQueue.main.async {
                            self.image = UIImage(data: imageData)
                        }
                   }
                }
            }.resume()
        }
    }
}


