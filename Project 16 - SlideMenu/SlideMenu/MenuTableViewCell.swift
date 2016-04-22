//
//  MenuTableViewCell.swift
//  SlideMenu <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/22.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
