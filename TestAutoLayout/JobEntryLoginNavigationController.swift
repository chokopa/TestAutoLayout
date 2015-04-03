//
//  JobEntryLoginNavigationController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/03/09.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit


class JobEntryLoginNavigationController: UINavigationController {
    
    func superPushViewController(viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
    }
    
    func superPopToRootViewControllerAnimated(animated: Bool) -> [AnyObject]? {
        return super.popToRootViewControllerAnimated(animated)
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if animated {
            UIView.transitionWithView(view, duration: 0.6, options: .TransitionCurlUp,
                animations: { () -> Void in
                    self.superPushViewController(viewController, animated: animated)
                }
                , completion: nil)
        } else {
            super.pushViewController(viewController, animated: animated)
        }
    }
    
    override func popToRootViewControllerAnimated(animated: Bool) -> [AnyObject]? {
        var vcs: [AnyObject]?
        
        if animated {
            UIView.transitionWithView(view, duration: 0.6, options: .TransitionCurlUp,
                animations: { () -> Void in
                    vcs = self.superPopToRootViewControllerAnimated(animated)
                }
                , completion: nil)
        } else {
            vcs = super.popToRootViewControllerAnimated(animated)
        }
        
        return vcs
    }
}