//
//  GameCell.swift
//  TwitchFeed
//
//  Created by Кирилл Рябинин on 11.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImageView: UIImageView!
    
    func configureCell(_ game: Game) {
        if game.gameImage != nil {
            gameImageView.image = game.gameImage
            gameImageView.layer.cornerRadius = 10
            gameImageView.layer.masksToBounds = true
        }
    }
    
}
