//
//  ViewController.swift
//  CarouselEffect <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/11.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController {
    
    private var interests = Interest.createInterests()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    private struct Storyboard {
        static let CellIdentifier = "InterestCell"
    }
}

extension ViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! InterestCell
        
        cell.interest = self.interests[indexPath.item]
        
        return cell
        
    }

}
