//
//  InterestCell.swift
//  CarouselEffect <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/11.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class InterestCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        interestTitleLabel?.text! = interest.title
        featuredImageView?.image! = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
}
