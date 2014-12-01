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
        label?.text = "Touch Me."
        
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            //
            self.label!.alpha = 1
        })

        /*
        UIView.animateWithDuration(NSTimeInterval(0.25), animations: { (t) -> Void in
            self.label?.layer.opacity = 1
        })*/
    }
    
    var isTouching = false
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if(isTouching || !canTouch) {
            return
        }
        
        isTouching = true
        
        label?.text = ""
        NSTimer.scheduledTimerWithTimeInterval(1.75, target: self, selector: "allowTouch", userInfo: nil, repeats: false)
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        isTouching = false
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        isTouching = false
    }


}

