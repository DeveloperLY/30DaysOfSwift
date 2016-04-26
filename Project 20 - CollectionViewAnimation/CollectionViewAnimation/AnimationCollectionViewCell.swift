//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
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
    
    func prepareCell(viewModel: AnimationCellModel) {
        animationImageView.image = UIImage(named: viewModel.imagePath)
        animationTextView.scrollEnabled = false
        backButton.hidden = true
        addTapEventHandler()
    }
    
    func handleCellSelected() {
        animationTextView.scrollEnabled = false
        backButton.hidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    private func addTapEventHandler() {
        backButton.addTarget(self, action: Selector("backButtonDidTouch:"), forControlEvents: .TouchUpInside)
    }
    
    func backButtonDidTouch(sender: UIGestureRecognizer) {
        backButtonTapped?()
    }
}
