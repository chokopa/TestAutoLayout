//
//  AView.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/04/02.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class AView: UIView {
    
    var imageView: UIImageView!
    
    override func drawRect(rect: CGRect) {
    }
    
    func startAnimation() {
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        var images = [CGImageRef]()
        for var i = 1; i <= 100; i++ {
            let image = drawArcInRect(self.bounds, colorSpace: colorSpace, matchPoint: i)
            images.append(image.CGImage)
        }
        
        let layer = CALayer()
        
        var anim = CAKeyframeAnimation(keyPath: "contents")
        anim.values = images
        anim.duration = 1
        anim.repeatCount = 1
        anim.fillMode = kCAFillModeForwards
        anim.autoreverses = false
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        anim.removedOnCompletion = false
        layer.addAnimation(anim, forKey: "contents")
        layer.frame = self.bounds
        self.layer.addSublayer(layer)
    }
    
    func drawSkyInRect(rect: CGRect, context: CGContextRef, colorSpace: CGColorSpaceRef) {
        let colors: [CGFloat] = [
            148/255, 158/255, 183/255, 1,
            127/255, 138/255, 166/255, 1,
            96/255, 111/255, 144/255, 1
        ]
        let gradient = CGGradientCreateWithColorComponents(colorSpace, colors, nil, 3)
        let startPoint = rect.origin
        var endPoint = rect.origin
        endPoint.y = rect.size.height
        
        CGContextSaveGState(context)
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0)
    }
    
    func drawMountainsInRect(rect: CGRect, context: CGContextRef, colorSpace: CGColorSpaceRef) {
        CGContextSaveGState(context)
        CGContextSetLineWidth(context, 4)
        
        let colors: [CGFloat] = [
            1/255, 93/255, 67/255, 1,
            63/255, 109/255, 79/255, 1
        ]
        let gradient = CGGradientCreateWithColorComponents(colorSpace, colors, nil, 2)
        var startPoint = rect.origin
        startPoint.y = 100
        var endPoint = rect.origin
        endPoint.y = rect.size.height
        
        let backgroundMountains = CGPathCreateMutable()
        CGPathMoveToPoint(backgroundMountains, nil, -5, 157)
        CGPathAddQuadCurveToPoint(backgroundMountains, nil, 30, 129, 77, 157)
        CGPathAddCurveToPoint(backgroundMountains, nil, 190, 210, 200, 70, 303, 125)
        CGPathAddLineToPoint(backgroundMountains, nil, rect.width + 5, 157)
        CGPathAddLineToPoint(backgroundMountains, nil, rect.width + 5, rect.height)
        CGPathAddLineToPoint(backgroundMountains, nil, -5, rect.height)
        CGPathCloseSubpath(backgroundMountains)
        
        CGContextAddPath(context, backgroundMountains)
        CGContextSaveGState(context)
        
        CGContextClip(context)
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0)
        CGContextRestoreGState(context)
        
        CGContextAddPath(context, backgroundMountains)
        
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokePath(context)

        let foregroundMountains = CGPathCreateMutable()
        CGPathMoveToPoint(foregroundMountains, nil, -5, 190)
        CGPathAddCurveToPoint(foregroundMountains, nil, 160, 250, 200, 140, 303, 190)
        CGPathAddCurveToPoint(foregroundMountains, nil, 430, 250, 550, 170, 590, 210)
        CGPathAddLineToPoint(foregroundMountains, nil, 590, 230)
        CGPathAddCurveToPoint(foregroundMountains, nil, 300, 260, 140, 215, 0, 225)
        CGPathCloseSubpath(foregroundMountains)

        CGContextAddPath(context, foregroundMountains)
        CGContextSaveGState(context)
        
        CGContextClip(context)
        CGContextSetFillColorWithColor(context, UIColor.yellowColor().CGColor)
        CGContextFillRect(context, CGRectMake(0, 170, rect.width, 90))
        CGContextRestoreGState(context)
        
        CGContextAddPath(context, foregroundMountains)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextStrokePath(context)
    }

    //func drawArcInRect(rect: CGRect, context: CGContextRef, colorSpace: CGColorSpaceRef) -> UIImage {
    func drawArcInRect(rect: CGRect, colorSpace: CGColorSpaceRef, matchPoint: Int) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        let framePath = CGPathCreateMutable()
        let val = Double(3 + 6 * matchPoint / 100)
        let startAngle = CGFloat(M_PI * 3 / 4)
        let endAngle = CGFloat(M_PI * val / 4)
        CGPathAddArc(framePath, nil, rect.width / 2, rect.height / 2, 40, startAngle, endAngle, false)
        CGPathAddArc(framePath, nil, rect.width / 2, rect.height / 2, 30, endAngle, startAngle, true)
        CGPathCloseSubpath(framePath)
        CGContextAddPath(context, framePath)
        
        CGContextClip(context)
        
        var colors: [CGFloat]!
        if matchPoint == 100 {
            let _colors: [CGFloat] = [
                255/255, 155/255, 51/255, 1,
                255/255, 99/255, 99/255, 1,
            ]
            colors = _colors
        } else if 90 <= matchPoint {
            let _colors: [CGFloat] = [
                253/255, 189/255, 54/255, 1,
                255/255, 147/255, 58/255, 1,
            ]
            colors = _colors
        } else if 80 <= matchPoint {
            let _colors: [CGFloat] = [
                250/255, 226/255, 78/255, 1,
                253/255, 188/255, 53/255, 1,
            ]
            colors = _colors
        } else if 70 <= matchPoint {
            let _colors: [CGFloat] = [
                95/255, 201/255, 104/255, 1,
                213/255, 225/255, 87/255, 1,
            ]
            colors = _colors
        } else {
            let _colors: [CGFloat] = [
                28/255, 169/255, 173/255, 1,
                94/255, 201/255, 104/255, 1,
            ]
            colors = _colors
        }
        
        let gradient = CGGradientCreateWithColorComponents(colorSpace, colors, nil, 2)
        var startPoint = CGPointMake(0, 0)
        var endPoint = CGPointMake(rect.width, 0)

        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0)
       
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
