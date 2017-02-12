//
//  PhotoDataService.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 12.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import Foundation
import Alamofire

class PhotoDataService {
    static let instance = PhotoDataService()
    
    var photos = [Photo]()
    
    func downloadPhotos(completed: @escaping DownloadComplete) {
        
        var nameString: String!
        var dateString: String!
        var tagString: String!
        var imageUrlString: String!
        
        let url = FLICKR_URL_PHOTOS
        


request(url).responseJSON { (response) in
    print(response)
    if let JSON = response.result.value as? [String : Any] {
        
        if let photosArray = JSON["items"] as? [[String : Any]], photosArray.count > 0  {
            for i in 0..<photosArray.count {
                if let photoName = photosArray[i]["title"] as? String {
                    nameString = photoName
                }
                if let photoDate = photosArray[i]["date_taken"] as? String {
                    dateString = photoDate
                }
                if let photoTag = photosArray[i]["tags"] as? String {
                    tagString = photoTag
                }

                if let photoDict = photosArray[i]["media"] as? [String : Any] {
                    if let imageUrl = photoDict["m"] as? String {
                        imageUrlString = imageUrl
                    }
                }
                let photo = Photo(name: nameString, imageUrl: imageUrlString, date: dateString, tag: tagString)
                self.photos.append(photo)
            }
        }
        
    }
    completed()
}
}
}


