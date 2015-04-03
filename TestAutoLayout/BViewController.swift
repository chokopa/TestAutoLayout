//
//  BViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/02/18.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class BViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var curImageView: UIImageView!
    @IBOutlet weak var tailImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        tailImgView.hidden = true
        let v = UIView(frame: CGRectMake(0, 300, scrollView.frame.width, 1000))
        v.backgroundColor = UIColor.blueColor()
        scrollView.addSubview(v)
        scrollView.contentSize = CGSizeMake(scrollView.frame.width, 2000)
    }

}

extension BViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let gy = scrollView.contentOffset.y
        
        let width = scrollView.frame.width
        if gy < 236 {
            tailImgView.hidden = true
            curImageView.hidden = false
        } else {
            tailImgView.hidden = false
            tailImgView.image = curImageView.image
            curImageView.hidden = true
        }
    }
}

