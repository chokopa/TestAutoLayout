//
//  ViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/02/12.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var bView: UIView!
    
    var circle: CAShapeLayer!
    var circle2: CAShapeLayer!
    
    var gl: CAGradientLayer!
    
    @IBAction func tapBtn(sender: AnyObject) {
        drawCircleAnimation(circle)
        //gradientAnimation(gl)
    }
    
    func getGradient(colors: Array<AnyObject>, locations: Array<AnyObject>) -> CAGradientLayer {
        let pageGradient = CAGradientLayer()
        pageGradient.frame = view.bounds
        pageGradient.colors = colors
        pageGradient.locations = locations
        return pageGradient
    }
    
    func drawCircle(targetView: UIView) {
        let lineWidth: CGFloat = 10
        targetView.layer.borderWidth = 1
        targetView.layer.borderColor = UIColor.redColor().CGColor

        let clength: CGFloat = targetView.frame.size.width - lineWidth * 3
        circle = CAShapeLayer()
        circle.path = UIBezierPath(roundedRect: CGRectMake(0, 0, clength, clength), cornerRadius: clength / 2).CGPath
        circle.position = CGPointMake(lineWidth / 2, lineWidth / 2)
        circle.lineWidth = lineWidth
        circle.strokeColor = UIColor.blueColor().CGColor
        
targetView.layer.addSublayer(circle)
        /*
        let colors: [AnyObject] = [
            UIColor(hex: "ff0000").CGColor,
            UIColor(hex: "00ff55").CGColor
        ]
        let locations: [AnyObject] = [
            0, 1.0
        ]
        gl = CAGradientLayer()
        gl.frame = targetView.bounds
        gl.colors = colors
        gl.locations = locations
        gl.mask = circle
        targetView.layer.addSublayer(gl)*/

    }
    
    func drawCircle2(targetView: UIView) {
        let lineWidth: CGFloat = 30
        
        let clength: CGFloat = targetView.frame.size.width - 30
        circle2 = CAShapeLayer()
        circle2.path = UIBezierPath(roundedRect: CGRectMake(0, 0, clength, clength), cornerRadius: clength / 2).CGPath
        circle2.position = CGPointMake(5, 5)
        circle2.lineWidth = lineWidth
        circle2.strokeColor = UIColor.clearColor().CGColor
        targetView.layer.addSublayer(circle2)
    }

    func drawCircleAnimation(clayer: CALayer) {
        var drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation!.duration = 2
        drawAnimation!.repeatCount = 1
        drawAnimation!.fromValue = 1
        drawAnimation!.toValue = 0
        drawAnimation!.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        drawAnimation!.removedOnCompletion = false;
        drawAnimation!.fillMode = kCAFillModeForwards
        drawAnimation!.autoreverses = true
        clayer.addAnimation(drawAnimation, forKey: "updateGageAnimation")
    }
    
   
    func gradientAnimation(clayer: CALayer) {
        var strokeColorAnim = CAKeyframeAnimation(keyPath: "colors")
        
        strokeColorAnim.values = [
            [
                UIColor(hex: "ff0000").CGColor,
                UIColor(hex: "00ff55").CGColor
            ],
            [
                UIColor(hex: "0055ff").CGColor,
                UIColor(hex: "00ff00").CGColor
            ],
            [
                UIColor(hex: "00ffff").CGColor,
                UIColor(hex: "ff2b00").CGColor
            ]
        ]
        strokeColorAnim.duration = 4
        strokeColorAnim.repeatCount = 1
        strokeColorAnim.fillMode = kCAFillModeForwards
        strokeColorAnim.autoreverses = false
        strokeColorAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        strokeColorAnim.removedOnCompletion = false
        clayer.addAnimation(strokeColorAnim, forKey: "updateGradientAnimation2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var aCircle: CAShapeLayer = CAShapeLayer()
        drawCircle(aView)
        //drawCircle2(aView)
    }
    
}

