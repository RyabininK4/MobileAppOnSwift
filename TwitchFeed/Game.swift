//
//  Game.swift
//  TwitchFeed
//
//  Created by Кирилл Рябинин on 11.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit
import Alamofire

class Game {
    
    var gameName: String!
    var gameImageUrl: String!
    var gameImage: UIImage?
    
    init(name: String, imageUrl: String) {
        self.gameName = name
        self.gameImageUrl = imageUrl
    }
    
    func downloadGameImage(completed: @escaping DownloadComplete) {
        request(self.gameImageUrl).responseData { (response) in
            if let data = response.result.value {
                if let image = UIImage(data: data) {
                self.gameImage = image
                }
            }
            completed()
        }
    }
        
}
