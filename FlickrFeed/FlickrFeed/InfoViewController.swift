//
//  InfoViewController.swift
//  FlickrFeed
//
//  Created by Кирилл Рябинин on 12.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var infoTableView: UITableView!
    
    var photo: Photo!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //заголовок страницы
        title = "\(photo.photoName!)"
        
        infoTableView.delegate = self
        infoTableView.dataSource = self
    }
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = infoTableView.dequeueReusableCell(withIdentifier: "PHOTOCell", for: indexPath) as?
            InfoCell {
            return cell
        } else {
            return InfoCell()
        }
    }

    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (infoTableView.bounds.width / 16) * 9
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO
    }


}
