//
//  PhotoCell.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 12.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var photoDate: UILabel!
    @IBOutlet weak var photoTag: UILabel!
    
    func configureCell(_ photo: Photo) {
        
        photoTitle.text = photo.photoName
        photoDate.text = photo.photoDate
        photoTag.text = photo.photoTag
        
        if photo.photoImage != nil {
            photoImageView.image = photo.photoImage
            photoImageView.layer.cornerRadius = 10
            photoImageView.layer.masksToBounds = true
        }
    }
}
