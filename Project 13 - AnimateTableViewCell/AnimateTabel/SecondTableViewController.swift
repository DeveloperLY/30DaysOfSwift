//
//  SecondTableViewController.swift
//  AnimateTabel <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/19.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class SecondTableViewController: UITableViewController {
    
    let ID = "SecondTableViewCell"
    
    var tableData = [
        "如果不过是人海茫茫中短暂的相遇，",
        "一个没有延续的擦肩再陌路分离。",
        "或许留下的只有这些，",
        "伸出双手冰冷掌心的凄凉，",
        "不知所措的记忆忧伤。",
        "难道还比不过昙花盛绽的一瞬，",
        "闭上双目时间就那么长，",
        "花还未开，",
        "人已成散。",
        "也许只是为了离开时不再为此忧伤，",
        "注定的别离何提誓言，",
        "依稀成影留给时间。",
        "不过是若梦浮生里弹指的瞬变，",
        "长河生命剪影也不过的朦胧。",
        "可能明天就不再有你，",
        "多情无意只是岁月的迷离，",
        "千丝万屡揉碎在今天里。",
        "仿佛南珂一梦禁不住叹息，",
        "没有泪却忍不住的倦意。",
        "从此不再有你，",
        "好似从来没有过的交集。"
    ]
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: ID)
        self.tableView.rowHeight = 60
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animateTable()
    }
    
    func animateTable() {
        
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.0, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18.0)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor =  colorforIndex(indexPath.row)
        
    }
    
    func colorforIndex(_ index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }
}
