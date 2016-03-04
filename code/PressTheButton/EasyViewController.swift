//
//  EasyViewController.swift
//  PressTheButton
//
//  Created by Shaan Appel on 3/4/16.
//  Copyright © 2016 Shaan Appel. All rights reserved.
//

import SwiftSpinner

class EasyViewController: UIViewController {
    var timer = NSTimer()

    @IBOutlet weak var movingButton: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        timer.invalidate()
    }
    
    
    
        
        
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
            
        dispatch_after(popTime, dispatch_get_main_queue()) {
                completion()
        }
    }
        
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
            
        self.runSpinner()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: Selector("moveButton"), userInfo: nil, repeats: true)
            
    }
        
    func runSpinner() {
            
            
        SwiftSpinner.show("Connecting \nto Internet...").addTapHandler({
                print("tapped")
                SwiftSpinner.hide()
                }, subtitle: "Tap to hide Spinner!")
            
            
        delay(seconds: 3.0, completion: {
            SwiftSpinner.show("Establishing \nConnection...", animated: false).addTapHandler({
                    print("tapped")
                    SwiftSpinner.hide()
                    }, subtitle: "Tap to hide Spinner!")
        })
            
            
        delay(seconds: 4.0, completion: {
                SwiftSpinner.hide()
        })
            
    }
        
    func moveButton() {
            
        UIView.animateWithDuration(0.2, delay: 0.0,
            options: [], animations: {
                // Find the button's width and height
                let buttonWidth = self.movingButton.frame.width
                let buttonHeight = self.movingButton.frame.height
                    
                // Find the width and height of the enclosing view
                let viewWidth = self.movingButton.superview!.bounds.width
                let viewHeight = self.movingButton.superview!.bounds.height
                    
                // Compute width and height of the area to contain the button's center
                let xwidth = viewWidth - buttonWidth
                let yheight = viewHeight - buttonHeight
                    
                // Generate a random x and y offset
                let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
                let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
                    
                // Offset the button's center by the random offsets.
                self.movingButton.center.x = xoffset + buttonWidth / 2
                self.movingButton.center.y = yoffset + buttonHeight / 2
            }, completion: nil)
            
    }
        
}

