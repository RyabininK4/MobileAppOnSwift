//
//  WebViewController.swift
//  FlickerMA
//
//  Created by Кирилл Рябинин on 13.02.17.
//  Copyright © 2017 Кирилл Рябинин. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var url: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.loadRequest(URLRequest(url: URL(string: url!)!))
    }



}
