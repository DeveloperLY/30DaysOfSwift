//
//  ViewController.swift
//  SwipeableCell <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/27.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

let ID = "PatternCell";

class ViewController: UITableViewController {
    
    var data = [
        Pattern(image: "1", name: "Pattern Building"),
        Pattern(image: "2", name: "Joe Beez"),
        Pattern(image: "3", name: "Car It's car"),
        Pattern(image: "4", name: "Floral Kaleidoscopic"),
        Pattern(image: "5", name: "Sprinkle Pattern"),
        Pattern(image: "6", name: "Palitos de queso"),
        Pattern(image: "7", name: "Ready to Go? Pattern"),
        Pattern(image: "8", name: "Sets Seamless"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath) as! PatternCell
        
        let pattern = data[indexPath.row]
        
        cell.patternImageView.image = UIImage(named: pattern.image)
        cell.patternNameLabel.text = pattern.name
        return cell
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .Normal, title: "🗑\nDelete") { action, index in
            print("Delete button tapped")
        }
        
        //      let bgImage = UIImageView(image: UIImage(named: "love"))
        delete.backgroundColor = UIColor.grayColor()
        //      more.addSubview(bgImage)
        
        let share = UITableViewRowAction(style: .Normal, title: "🤗\nShare") { (action: UITableViewRowAction!, indexPath: NSIndexPath) -> Void in
            
            let firstActivityItem = self.data[indexPath.row]
            
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        
        share.backgroundColor = UIColor.redColor()
        
        let download = UITableViewRowAction(style: .Normal, title: "⬇️\nDownload") { action, index in
            print("Download button tapped")
        }
        download.backgroundColor = UIColor.blueColor()
        
        return [download, share, delete]
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
}
