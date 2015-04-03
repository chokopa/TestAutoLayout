//
//  A1ViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/03/06.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class A1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.setNavigationBarHidden(true, animated: false)
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    @IBAction func tapBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: { () -> Void in
            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("A2VC")  as UIViewController
            self.navigationController!.pushViewController(vc, animated: true)
        })
        
    }
    
}
