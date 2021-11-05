//
//  MovieModel.swift
//  MovieKiller
//
//  Created by admin on 04/11/2021.
//

import Foundation

struct Search: Codable {
    var movie : Array<Movie>
    
    enum SearchCodingKeys : String, CodingKey{
        case search = "Search"
    }
        
    init(movie: Array<Movie>){
        self.movie = movie
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:  SearchCodingKeys.self)
        self.movie = try container.decode(Array<Movie>.self, forKey: .search)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = try encoder.container(keyedBy: SearchCodingKeys.self)
        try container.encode(self.movie, forKey: .search)
    }
}
    
    
struct Movie : Codable{
    var title : String
    var year : String
    var poster : URL


    enum MovieCodingKeys : String, CodingKey{
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
    }

    init(title: String, year: String, poster : URL){
        self.title = title
        self.year = year
        self.poster = poster
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy:  MovieCodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.year = try container.decode(String.self, forKey: .year)
        self.poster = try container.decode(URL.self, forKey: .poster)
    }

    func encode(to encoder: Encoder) throws {
        var container = try encoder.container(keyedBy: MovieCodingKeys.self)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.year, forKey: .year)
        try container.encode(self.poster, forKey: .poster)
    }
    
}
 

