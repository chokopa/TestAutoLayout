//
//  AViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/02/18.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class AViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tailImageView: UIImageView!
    
    var xxcel: ImgCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.registerNib(UINib(nibName: "ImgCell", bundle: nil), forCellReuseIdentifier: "imgCell")
        
        tailImageView.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        //tableView.contentOffset = CGPointMake(0, 300)
    }
    
    override func viewDidAppear(animated: Bool) {
        println(xxcel.imgView.image!.size)
        println(xxcel.bounds)

    }
}

extension AViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let gy = tableView.contentOffset.y

        let width = tableView.frame.width
        if gy < 236 {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            tailImageView.hidden = true
        } else {
            tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
            tailImageView.hidden = false
            tailImageView.image = xxcel.imgView.image
        }
        /*
        if (gy < 218) {
            
            tailImgView.hidden = true
            //            headerImgTailView?.hidden = true
            
            var p = gy / 218.0
            if (p > 1.0) {
                p = 1.0
            }
            imgFrontView.alpha = 1.0 - p
            topHeaderMaskView.alpha = 1.0 - p
            tailImgMaskView.hidden = true
            
            CTLog.debug(gy)
            headerMaskView.backgroundColor = UIColor(hex: "000000", alpha: gy / 218.0 * 0.6)
        } else {
            
            tailImgView.image = currentImgView.image
            tailImgView.hidden = false
            tailImgMaskView.hidden = false
            
            //            headerImgTailView?.hidden = false
            headerMaskView.backgroundColor = UIColor(hex: "000000", alpha: 0)
            //            headerMaskView.backgroundColor = UIColor(hex: "000000", alpha: 0.6)
        }
*/
    }
}

extension AViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        }
        
        return 600
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 300
        }
        
        return 600
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        
        let l = UILabel()
        l.text = "セクション\(section)"
        l.backgroundColor = UIColor.redColor()
        return l
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        
        return 20
    }
    
    func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        
        return 20
    }
}

extension AViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("imgCell") as ImgCell
            cell.backgroundColor = UIColor.blueColor()
            xxcel = cell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            cell.backgroundColor = UIColor.yellowColor()
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
            cell.backgroundColor = UIColor.greenColor()
            return cell
        }
    }
}
