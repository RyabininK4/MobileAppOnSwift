//
//  ViewController.swift
//  TwitterFeed
//
//  Created by Кирилл Рябинин on 07.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Importing objects
    
    @IBOutlet weak var MyTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func search(_ sender: UIButton)
    {
        if MyTextField.text != ""
        {
            let user = MyTextField.text?.replacingOccurrences(of: " ", with: "")
            getStuff(user: user!)
            
        }
    }
    
    //Creating function that gets all of the stuff
    func getStuff(user:String)
    {
        let url = URL(string: "http://twitter.com/" + user)
        
        let task = URLSession.shared.dataTask(with: url!) {(data,response,error) in
            if error != nil
            {
                DispatchQueue.main.async
                {
                    if let errorMessage = error?.localizedDescription
                    {
                        self.myLabel.text = errorMessage
                    }
                    else
                    {
                        self.myLabel.text = "there has been an error. Try again"
                    }
                }
            }
            else
            {
                let webContent :String = String(data: data!, encoding: String.Encoding.utf8)!
                
                //Get the name
                var array:[String] = webContent.components(separatedBy: "<title>")
                array = array[1].components(separatedBy: " |")
                let name =  array[0]
                array.removeAll()
                
                //Get the profile pictures
                array = webContent.components(separatedBy: "data-resolved-url-large=\"")
                array = array[1].components(separatedBy: "\"")
                let profilePicture = array[0]
                print(profilePicture)
                
                DispatchQueue.main.async
                {
                    self.myLabel.text = name
                    self.updateImage(url: profilePicture)
                }
            }
        }
        task.resume()
    }
    
    //Function that gets profile picture data
    func updateImage(url:String)
    {
        let url = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: url!) {(data,response,error) in
            DispatchQueue.main.async
            {
                self.myImageView.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

