//
//  ViewController.swift
//  SnapChatMenu <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/10.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewWidth = UIScreen.main.bounds.size.width;
        let viewHeight = UIScreen.main.bounds.size.height;
        
        let leftVC: LeftViewController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        leftVC.view.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        let centerVC: CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        let rightVC: RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMove(toParentViewController: self)
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMove(toParentViewController: self)
        
        self.addChildViewController(centerVC)
        self.scrollView.addSubview(centerVC.view)
        centerVC.didMove(toParentViewController: self)
        
        var centerViewFrame = self.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerVC.view.frame = centerViewFrame
        
        var rightViewFrame = self.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        rightVC.view.frame = rightViewFrame
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 3 , height: self.view.frame.size.height)
        
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

}

