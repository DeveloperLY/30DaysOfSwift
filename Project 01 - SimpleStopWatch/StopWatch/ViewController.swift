//
//  ViewController.swift
//  StopWatch <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/7.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    
    /**
     状态栏样式控制方法
     
     - returns: 默认/高亮
     */
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
    }
    
    /**
     重置按钮点击事件
     
     - parameter sender: 重置按钮
     */
    @IBAction func resetButtonDidClick(_ sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0.0;
        timeLabel.text = String(counter)
        playButton.isEnabled = true
        pauseButton.isEnabled = true 
    }
    
    /**
     开始按钮点击事件
     
     - parameter sender: 开始按钮
     */
    @IBAction func playButtonDidClick(_ sender: UIButton) {
        if (isPlaying) {
            return
        }
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
        isPlaying = true
    }

    /**
     暂停按钮点击事件
     
     - parameter sender: 暂停按钮
     */
    @IBAction func pauseButtonDidClick(_ sender: UIButton) {
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    func updateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }

}

