//
//  VideoCell.swift
//  PlayLocalVideo <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/9.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

typealias funcBlock = () -> ()

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    var cellBackBlock : funcBlock?
    
    
    @IBAction func playVideoButtonDidClick(sender: UIButton) {
        if (self.cellBackBlock != nil) {
            self.cellBackBlock!()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
