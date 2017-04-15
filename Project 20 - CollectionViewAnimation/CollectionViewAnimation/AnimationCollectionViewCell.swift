//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!
    
    var backButtonTapped: (() -> Void)?
    
    func prepareCell(_ viewModel: AnimationCellModel) {
        animationImageView.image = UIImage(named: viewModel.imagePath)
        animationTextView.isScrollEnabled = false
        backButton.isHidden = true
        addTapEventHandler()
    }
    
    func handleCellSelected() {
        animationTextView.isScrollEnabled = false
        backButton.isHidden = false
        self.superview?.bringSubview(toFront: self)
    }
    
    fileprivate func addTapEventHandler() {
        backButton.addTarget(self, action: #selector(AnimationCollectionViewCell.backButtonDidTouch(_:)), for: .touchUpInside)
    }
    
    func backButtonDidTouch(_ sender: UIGestureRecognizer) {
        backButtonTapped?()
    }
}
