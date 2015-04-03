//
//  ViewController2.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/04/02.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//
import UIKit


class ViewController2: UIViewController {
    
    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var bView: UIView!
    
    @IBAction func tapBtn(sender: AnyObject) {
        drawCircleAnimation("strokeEnd", animeName: "updateGageAnimation", fromValue: 0, toValue: 0.75, duration: 3, repeat: 1.0, flag: false)
    }
    func getGradient(colors: Array<AnyObject>, locations: Array<AnyObject>) -> CAGradientLayer {
        let pageGradient = CAGradientLayer()
        pageGradient.frame = view.bounds
        pageGradient.colors = colors
        pageGradient.locations = locations
        return pageGradient
        
    }
    // CAShapeLayerインスタンスを生成
    var aCircle: CAShapeLayer = CAShapeLayer()
    var bCircle: CAShapeLayer = CAShapeLayer()
    // ※前提条件としてtargetViewが正方形であること
    func drawCircle(targetView: UIView, circle: CAShapeLayer, vColor: UIColor) {
        
        // ゲージ幅
        let lineWidth: CGFloat = 10
        
        // 描画領域のwidth
        let viewScale: CGFloat = targetView.frame.size.width
        targetView.layer.borderWidth = 1
        targetView.layer.borderColor = UIColor.redColor().CGColor
        
        // 円のサイズ
        let radius: CGFloat = viewScale - lineWidth * 3
        
        // 円の描画path設定
        circle.path = UIBezierPath(roundedRect: CGRectMake(0, 0, radius, radius), cornerRadius: radius / 2).CGPath
        
        // 円のポジション設定
        circle.position = CGPointMake(lineWidth / 2, lineWidth / 2)
        
        // 塗りの色を設定
        circle.fillColor = UIColor.blueColor().CGColor
        
        // 線の色を設定
        circle.strokeColor = UIColor.lightGrayColor().CGColor
        
        // 線の幅を設定
        circle.lineWidth = lineWidth
        
        circle.strokeStart = 0
        circle.strokeEnd = 1
        
        // 該当のUIViewのlayerにsublayerとしてCALayerを追加
        //targetView.layer.addSublayer(circle)
        
        let colors: [AnyObject] = [
            UIColor(hex: "ff0000").CGColor,
            UIColor(hex: "00ff55").CGColor
        ]
        let locations: [AnyObject] = [
            0, 1.0
        ]
        var gl = getGradient(colors, locations: locations)
        gl.mask = circle
        targetView.layer.addSublayer(gl)
        
        
        // duration0.0のアニメーションにて初期描画(線が書かれていない状態)にしておく
        //drawCircleAnimation("strokeEnd", animeName: "updateGageAnimation", fromValue: 0.0, toValue: 0.0, duration: 0.1, repeat: 1.0, flag: false)
        
        //targetView.transform = CGAffineTransformRotate(targetView.transform, 3.14 * 5 / 4)
        
        
    }
    
    func drawCircleAnimation(key: String, animeName: String, fromValue: CGFloat, toValue: CGFloat, duration: NSTimeInterval, repeat: Float, flag: Bool) {
        
        // アニメーションkeyを設定
        var drawAnimation = CABasicAnimation(keyPath: key)
        
        // アニメーション間隔の指定
        drawAnimation!.duration = duration  // "animate over 10 seconds or so.."
        
        // 繰り返し回数の指定
        drawAnimation!.repeatCount = repeat  // Animate only once..
        
        // 起点と目標点の変化比率を設定 (0.0 〜 1.0)
        drawAnimation!.fromValue = fromValue
        drawAnimation!.toValue = toValue
        
        // イージングを決定
        drawAnimation!.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        // アニメ完了時の描画を保持
        drawAnimation!.removedOnCompletion = false;
        drawAnimation!.fillMode = kCAFillModeForwards;
        
        // 逆再生の指定
        drawAnimation!.autoreverses = flag
        
        //bCircle.strokeColor = UIColor.blueColor().CGColor
        
        
        var strokeColorAnim = CAKeyframeAnimation(keyPath: "strokeColor")
        
        strokeColorAnim.values = [
            UIColor.redColor().CGColor,
            UIColor.blueColor().CGColor,
            UIColor.greenColor().CGColor,
            UIColor.yellowColor().CGColor,
            UIColor.yellowColor().CGColor,
        ]
        strokeColorAnim.duration = duration
        strokeColorAnim.repeatCount = repeat
        strokeColorAnim.fillMode = kCAFillModeForwards
        strokeColorAnim.autoreverses = false
        strokeColorAnim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        
        // Add the animation to the circle
        bCircle.addAnimation(drawAnimation, forKey: animeName)
        bCircle.addAnimation(strokeColorAnim, forKey: "strokeColor")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawCircle(aView, circle: aCircle, vColor: UIColor.lightGrayColor())
        drawCircle(bView, circle: bCircle, vColor: UIColor.clearColor())
    }
}

