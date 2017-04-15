//
//  ViewController.swift
//  SpotifyVideoBackground <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/17.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: VideoSplashViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVideoBackground()
        
        loginButton.layer.cornerRadius = 4
        signupButton.layer.cornerRadius = 4
        
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func setUpVideoBackground() {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.isUserInteractionEnabled = false
    }

}

