//
//  DViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/02/24.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class DViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var btn: UIButton!
    weak var picker: UIPickerView!
    
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    var selectedIndex: Int!
    var areas: [[String: String]]!
    var showing = false
    
    func tapBtn(sender: UITapGestureRecognizer) {
        println("\(scrollView.frame), \(scrollView.contentSize)")
        showing = !showing
        
        let ableh = scrollView.contentSize.height - scrollView.frame.height
        
        let y = scrollView.contentOffset.y
        println(y)
        println(scrollView.frame.height)
        println(scrollView.contentSize.height)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        var tr = showing ? CGAffineTransformMakeTranslation(0, -180) : CGAffineTransformMakeTranslation(0, 180)
        picker.transform = tr
        picker.alpha = picker.alpha * -1 + 1
        
        if showing {
            scrollView.contentInset = UIEdgeInsets(top: 180, left: 0, bottom: 0, right: 0)
            
            var tr2 = CGAffineTransformMakeTranslation(0, -180)
            scrollView.transform = tr2
            
            scrollView.contentOffset.y = y - 180
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

            var tr2 = CGAffineTransformMakeTranslation(0, 0)
            scrollView.transform = tr2
            
            scrollView.contentOffset.y = ableh - 180 <= y ? y : y + 180
        }
        
        UIView.commitAnimations()
        
        println(scrollView.contentSize.height)
        
        println("\(scrollView.frame), \(scrollView.contentSize)")

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenWidth = UIScreen.mainScreen().bounds.width
        screenHeight = UIScreen.mainScreen().bounds.height
        
        scrollView.layer.borderColor = UIColor.blackColor().CGColor
        scrollView.layer.borderWidth = 2
        
        var picker = UIPickerView(frame: CGRectMake(0, screenHeight, screenWidth, 180))
        picker.backgroundColor = UIColor.blueColor()
        picker.dataSource = self
        picker.delegate = self
        picker.alpha = 0
        showing = false
        view.addSubview(picker)
        view.bringSubviewToFront(picker)
        self.picker = picker
        
        btn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector("tapBtn:")))
        areas = [["a" : "A"], ["b" : "B"], ["c" : "C"], ["d" : "D"]]
    }
}

extension DViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return areas[row].values.first!
    }
}

extension DViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return areas.count
    }
}
