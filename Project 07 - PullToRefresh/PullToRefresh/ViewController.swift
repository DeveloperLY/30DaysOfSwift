//
//  ViewController.swift
//  PullToRefresh <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/13.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
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
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        
        self.refreshControl!.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        self.refreshControl!.tintColor = UIColor.white
        
        self.title = "emoji"
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60.0
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell
        
        cell.textLabel?.text = self.emojiData[indexPath.row];
        
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 50.0)
        
        cell.backgroundColor = UIColor.clear
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    // MARK: - RoadEmoji
    func didRoadEmoji() {
        self.emojiData = newFavoriteEmoji
        self.tableView.reloadData()
        self.refreshControl!.endRefreshing()
    }
}

