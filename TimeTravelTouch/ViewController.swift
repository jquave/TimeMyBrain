//
//  ViewController.swift
//  TimeTravelTouch
//
//  Created by Jameson Quave on 11/30/14.
//  Copyright (c) 2014 JQ Software LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel?
    var timesPressed: Int = 0
    var delayForTouch: Double = 0.01

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label = UILabel(frame: UIScreen.mainScreen().bounds)
        label?.textAlignment = .Center
        label?.font = UIFont(name: "Helvetica", size: 48)
        label?.text = "Touch me"
        self.view.addSubview(label!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var canTouch = true
    func allowTouch() {
        canTouch = true
        label?.alpha = 0
        
        if(timesPressed<15) {
            label?.text = "Touch Me."
        }
        else if(timesPressed<20) {
            label?.text = "..."
        }
        else {
            label?.text = "Keep going..."
        }
        
        // And also show the message since touch is now allowed again
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.label!.alpha = 1
            self.view.backgroundColor = UIColor.whiteColor()
        })
        
    }
    
    func acceptTouch() {
        label?.text = "Well done."
        self.view.backgroundColor = UIColor.redColor()
        
        NSTimer.scheduledTimerWithTimeInterval(1.75, target: self, selector: "allowTouch", userInfo: nil, repeats: false)
        timesPressed++
    }
    
    var isTouching = false
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if(isTouching || !canTouch) {
            return
        }
        
        isTouching = true
        
        if timesPressed>10 {
            delayForTouch = 0.0
        }
        
        NSTimer.scheduledTimerWithTimeInterval(delayForTouch, target: self, selector: "acceptTouch", userInfo: nil, repeats: false)
        
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        isTouching = false
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        isTouching = false
    }


}

