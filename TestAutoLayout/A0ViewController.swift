//
//  A0ViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/03/06.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class A0ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func tapBtn(sender: AnyObject) {
        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("NAV")  as UIViewController
        presentViewController(vc, animated: true, completion: nil)
    }
    
}
