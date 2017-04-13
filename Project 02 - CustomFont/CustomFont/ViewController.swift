//
//  ViewController.swift
//  CustomFont <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/8.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "简书：DeveloperLY"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
        
        changeFontButton.layer.cornerRadius = 55;
        
        fontTableView.rowHeight = 50;
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    @IBAction func changeFontDidClick(_ sender: UIButton) {
        fontRowIndex = (fontRowIndex + 1) % 4
        fontTableView.reloadData()
    }
    
    // MARK: - <UITableViewDataSource>
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text;
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size: 16.0)
        
        return cell;
    }
    
}

