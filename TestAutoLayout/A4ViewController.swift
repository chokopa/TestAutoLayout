//
//  A4ViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/03/06.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit
//import QuartzCore

class A4ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.setNavigationBarHidden(true, animated: false)
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    @IBAction func tapBtn(sender: AnyObject) {
        let transition: CATransition = CATransition()
        transition.duration = 3.0
/*
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
*/

        self.navigationController!.view.layer.addAnimation(transition, forKey: kCATransition)
        self.navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
}