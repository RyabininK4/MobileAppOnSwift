//
//  ViewController.swift
//  FlickerMA
//
//  Created by Кирилл Рябинин on 08.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    var articles: [Article]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles()
    }
    
    func fetchArticles()
    {
    let urlRequest = URLRequest(url: URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response, error) in
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Article]()
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: AnyObject]
                
                if let articlesFromJson = json["items"] as? [[String: AnyObject]]
                {
                    for articleFromJson in articlesFromJson
                    {
                        let article = Article()
                        //if let urlToImage = articleFromJson["media"] as? [String : AnyObject]
                        //{
                            //let urlToImage = articleFromJson["m"] as? String
                            //{
                                //article.imageUrl = urlToImage
                            //}
                        //}
                        if let title = articleFromJson["title"] as? String,
                           let date = articleFromJson["date_taken"] as? String,
                           let tags = articleFromJson["tags"] as? String,
                           let url = articleFromJson["link"] as? String
                           {
                            article.date = date
                            article.tags = tags
                            article.headline = title
                            article.url = url
                            //article.imageUrl = urlToImage
                           }
                        self.articles?.append(article)
                        print (json)
                    }
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
    
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! ArticleCell
        
        cell.title.text = self.articles?[indexPath.item].headline
        cell.tags.text = self.articles?[indexPath.item].tags
        cell.date.text = self.articles?[indexPath.item].date
        //cell.imgView.downloadImage(from: (self.articles?[indexPath.item].imageUrl)!)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! WebViewController
        
        webVC.url = self.articles?[indexPath.item].url
        
        self.present(webVC, animated: true, completion: nil)
        
    }

}

extension UIImageView
{
    func downloadImage(from urlToImage: String)
    {
        let urlRequest = URLRequest(url: URL(string: urlToImage)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, responce, error) in
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
