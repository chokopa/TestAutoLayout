//
//  ViewController3.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/04/02.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var aView: AView!
    
    @IBAction func tapBtn(sender: AnyObject) {
        aView.startAnimation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
