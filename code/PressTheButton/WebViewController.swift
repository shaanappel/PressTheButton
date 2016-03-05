//
//  ViewController.swift
//  ShaanAnkurWebsiteFINAL
//
//  Created by Ankur Mahesh on 3/4/16.
//  Copyright © 2016 Ankur Mahesh. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var URL = ""
    @IBOutlet weak var website: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usableURL = NSURL(string: URL)
        let webRequest = NSURLRequest(URL: usableURL!)
        website.loadRequest(webRequest)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

