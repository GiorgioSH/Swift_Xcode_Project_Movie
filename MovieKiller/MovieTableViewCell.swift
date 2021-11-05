//
//  MovieTableViewCell.swift
//  Movie Killer
//
//  Created by Felix and George company certified.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
   
    @IBOutlet weak var myMovieLabel: UILabel!
    @IBOutlet weak var myMovieImage: UIImageView!
    @IBOutlet weak var myMovieYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
