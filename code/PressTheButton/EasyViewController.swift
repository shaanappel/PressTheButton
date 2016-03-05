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
    var difficultyAry = ["Easy", "Medium", "Hard", "Impossible"]
    var currDifficulty = 0
    var buttonMoveInterval = 0.6
    var buttonMoveDuration = 0.2
    var buttonMoveDurationAry = [0.2, 0.14, 0.12, 0.005]

    @IBOutlet weak var movingButton: UIButton!
    @IBOutlet weak var difficultyLabel: UILabel!
    
    @IBOutlet weak var retryButton: UIButton!
    
   
    @IBOutlet weak var youWonImage: UIImageView!
    @IBAction func buttonPressed(sender: AnyObject) {
        timer.invalidate()
        youWonImage.hidden = false
        
        retryButton.hidden = false
        retryButton.userInteractionEnabled = true
        
        
        movingButton.hidden = true
    }
    
    @IBAction func retryButtonPressed(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(buttonMoveInterval, target: self, selector: Selector("moveButton"), userInfo: nil, repeats: true)
        youWonImage.hidden = true
        retryButton.hidden = true
        retryButton.userInteractionEnabled = false
        movingButton.hidden = false
        currDifficulty += 1
        buttonMoveInterval = 0.4
        if currDifficulty <= difficultyAry.count - 1 {
            difficultyLabel.text = difficultyAry[currDifficulty]
            buttonMoveDuration = buttonMoveDurationAry[currDifficulty]
        } else {
            difficultyLabel.text = "Good Luck!"
            buttonMoveDuration = buttonMoveDuration/2
            buttonMoveInterval = buttonMoveInterval/2
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movingButton.layer.cornerRadius = movingButton.bounds.size.width/2;
        retryButton.layer.cornerRadius = 5
        difficultyLabel.text = difficultyAry[currDifficulty]
        
    }
        
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
            
        self.runSpinner()
        timer = NSTimer.scheduledTimerWithTimeInterval(buttonMoveInterval, target: self, selector: Selector("moveButton"), userInfo: nil, repeats: true)
        youWonImage.hidden = true
        movingButton.hidden = false
        retryButton.hidden = true
        retryButton.userInteractionEnabled = false
    }
        
    func runSpinner() {
            
            
        SwiftSpinner.show("Loading Game...").addTapHandler({
                print("tapped")
                SwiftSpinner.hide()
                }, subtitle: "Tap to hide Spinner!")
        
            
            
        delay(seconds: 2.0, completion: {
                SwiftSpinner.hide()
        })
            
    }
        
    func moveButton() {
            
        UIView.animateWithDuration(buttonMoveDuration, delay: 0.0,
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
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
}

