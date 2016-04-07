//
//  ViewController.swift
//  StopWatch <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/7.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
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
    var timer = NSTimer()
    var isPlaying = false
    
    /**
     状态栏样式控制方法
     
     - returns: 默认/高亮
     */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(counter)
    }
    
    /**
     重置按钮点击事件
     
     - parameter sender: 重置按钮
     */
    @IBAction func resetButtonDidClick(sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0.0;
        timeLabel.text = String(counter)
        playButton.enabled = true
        pauseButton.enabled = true 
    }
    
    /**
     开始按钮点击事件
     
     - parameter sender: 开始按钮
     */
    @IBAction func playButtonDidClick(sender: UIButton) {
        if (isPlaying) {
            return
        }
        playButton.enabled = false
        pauseButton.enabled = true
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
        isPlaying = true
    }

    /**
     暂停按钮点击事件
     
     - parameter sender: 暂停按钮
     */
    @IBAction func pauseButtonDidClick(sender: UIButton) {
        playButton.enabled = true
        pauseButton.enabled = false
        timer.invalidate()
        isPlaying = false
    }
    
    func updateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }

}

