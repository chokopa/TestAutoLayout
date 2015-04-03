//
//  CViewController.swift
//  TestAutoLayout
//
//  Created by shinsuke.tomita@bizreach.co.jp on 2015/02/20.
//  Copyright (c) 2015年 shinsuke.tomita@bizreach.co.jp. All rights reserved.
//

import UIKit

class CViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var heightCell: LabelCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "LabelCell", bundle: nil), forCellReuseIdentifier: "cell")
        heightCell = tableView.dequeueReusableCellWithIdentifier("cell") as LabelCell
    }
}

extension CViewController: UITableViewDelegate {
    
    func heightForRowAtIndexPath(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            heightCell.frame.size.width = CGRectGetWidth(tableView.bounds)
            heightCell.config()
            let h = heightCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
            println("3!!!!!!!!!\(h)")
            return h
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightForRowAtIndexPath(tableView, estimatedHeightForRowAtIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightForRowAtIndexPath(tableView, estimatedHeightForRowAtIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    }
}

extension CViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as LabelCell
        cell.config()
        return cell
    }
}

