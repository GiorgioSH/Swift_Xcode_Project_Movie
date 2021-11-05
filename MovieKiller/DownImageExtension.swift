//
//  DownImageExtension.swift
//  MovieKiller
//
//  Created by admin on 05/11/2021.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(url: URL?) {
        if let url = url {
            URLSession.shared.dataTask(with: url) {data,_,error in
                if let error = error {
                    print("Error occured : \(error)")
                }
                if let data = data {
                    if let imageData = data as Data? {
                       self.image = UIImage(data: imageData)
                   }
                }
            }.resume()
        }
    }
}
