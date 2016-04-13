//
//  ViewController.swift
//  PullToRefresh <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/13.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellIdentifer = "NewCellIdentifier"
    
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiData = favoriteEmoji
        
        self.tableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: "didRoadEmoji", forControlEvents: .ValueChanged)
        
        self.refreshControl!.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        self.refreshControl!.tintColor = UIColor.whiteColor()
        
        self.title = "emoji"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60.0
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer)! as UITableViewCell
        
        cell.textLabel?.text = self.emojiData[indexPath.row];
        
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        
        cell.textLabel?.font = UIFont.systemFontOfSize(50.0)
        
        cell.backgroundColor = UIColor.clearColor()
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    // MARK: - RoadEmoji
    func didRoadEmoji() {
        self.emojiData = newFavoriteEmoji
        self.tableView.reloadData()
        self.refreshControl!.endRefreshing()
    }
}

