//
//  ExploreCollectionViewController.swift
//  InstaFeed
//
//  Created by Кирилл Рябинин on 09.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class ExploreCollectionViewController: UICollectionViewController {
    
    let leftAndRightPaddings: CGFloat = 24.0
    let numberOfitemsPerRow: CGFloat = 2.0
    let heightAdjustment: CGFloat = 22.0
    
    struct Storyboard {
        static let explorePhotoCell = "ExplorePhotoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //config the collection view
        let width = (collectionView!.frame.width - leftAndRightPaddings) / numberOfitemsPerRow
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width + heightAdjustment)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.explorePhotoCell, for: indexPath) as! ExplorePhotoCollectionViewCell
    
        // Configure the cell
        cell.imageView.image = UIImage(named: "no_image")
    
        return cell
    }
}
