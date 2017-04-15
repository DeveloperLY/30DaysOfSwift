//
//  ViewController.swift
//  PlayLocalVideo <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/9.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UITableViewController {
    
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    let ID = "VideoCell"

    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.black
        
        self.tableView.rowHeight = 220;
        
        self.tableView.register(UINib(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier:ID)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ID, for: indexPath) as! VideoCell
        
        let video = data[indexPath.row]
        
        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        
        cell.cellBackBlock = {
            () -> ()
            in
            let path = Bundle.main.path(forResource: "emojiZone", ofType:"mp4")
            
            self.playerView = AVPlayer(url: URL(fileURLWithPath: path!))
            
            self.playViewController.player = self.playerView
            
            self.present(self.playViewController, animated: true) {
                self.playViewController.player?.play()
            }
        }
        
        return cell
    }
}

