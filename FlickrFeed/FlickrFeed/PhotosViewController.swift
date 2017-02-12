//
//  PhotosViewController.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 12.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var refreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "FlickrFeed"
        photosCollectionView.delegate = self
        photosCollectionView.dataSource = self
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(PhotosViewController.reloadData), for: UIControlEvents.valueChanged)
        photosCollectionView.insertSubview(refreshControl, at: 0)
        
        reloadData()
    }
    
    func reloadData() {
        PhotoDataService.instance.downloadPhotos {
            for photo in PhotoDataService.instance.photos {
                photo.downloadPhotoImage(completed:  {
                    self.photosCollectionView.reloadData()
                    self.loadingIndicator.stopAnimating()
                    self.refreshControl.endRefreshing()
                })
            }
        }
    }
    
    //MARK:UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoDataService.instance.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell {
            
            let photo = PhotoDataService.instance.photos[indexPath.row]
            cell.configureCell(photo)
            
            
            return cell
        } else {
            return PhotoCell()
        }
    }
    
    //MARK:UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    //MARK:UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (photosCollectionView.bounds.width) - 15
        let height = width - 50
        return CGSize(width: width, height: height)
    }
}
