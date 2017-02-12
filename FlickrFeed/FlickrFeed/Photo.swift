//
//  Photo.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 12.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit
import Alamofire

class Photo {
        var photoName: String!
        var photoDate: String!
        var photoTag: String!
        var photoImageUrl: String!
        var photoImage: UIImage?
        
    init(name: String, imageUrl: String, date: String, tag: String) {
            self.photoName = name
            self.photoImageUrl = imageUrl
            self.photoDate = date
            self.photoTag = tag
        }
        
        func downloadPhotoImage(completed: @escaping DownloadComplete) {
            request(self.photoImageUrl).responseData { (response) in
                if let data = response.result.value {
                    if let image = UIImage(data: data) {
                        self.photoImage = image
                    }
                }
                completed()
            }
        }
    
}
