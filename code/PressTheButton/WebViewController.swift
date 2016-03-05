//
//  ViewController.swift
//  ShaanAnkurWebsiteFINAL
//
//  Created by Ankur Mahesh on 3/4/16.
//  Copyright © 2016 Ankur Mahesh. All rights reserved.
//

import UIKit
import SwiftSpinner

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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        SwiftSpinner.show("Loading Website...").addTapHandler({
            print("tapped")
            SwiftSpinner.hide()
            }, subtitle: "Tap to hide Spinner!")
        
        
        
        delay(seconds: 2.0, completion: {
            SwiftSpinner.hide()
        })
    }
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    


}

