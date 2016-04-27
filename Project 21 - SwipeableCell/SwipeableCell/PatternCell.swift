//
//  PatternCell.swift
//  SwipeableCell <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/27.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

struct Pattern {
    let image: String
    let name: String
}

class PatternCell: UITableViewCell {
    
    @IBOutlet weak var patternImageView: UIImageView!
    @IBOutlet weak var patternNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
