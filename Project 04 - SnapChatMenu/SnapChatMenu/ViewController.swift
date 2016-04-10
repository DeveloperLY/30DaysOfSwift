//
//  ViewController.swift
//  SnapChatMenu <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/10.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftVC: LeftViewController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let centerVC: CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightVC: RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMoveToParentViewController(self)
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMoveToParentViewController(self)
        
        self.addChildViewController(centerVC)
        self.scrollView.addSubview(centerVC.view)
        centerVC.didMoveToParentViewController(self)
        
        var centerViewFrame = centerVC.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerVC.view.frame = centerViewFrame
        
        var rightViewFrame = rightVC.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        rightVC.view.frame = rightViewFrame
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3 , self.view.frame.size.height)
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

