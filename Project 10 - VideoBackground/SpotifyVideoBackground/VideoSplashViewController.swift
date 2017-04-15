//
//  VideoSplashViewController.swift
//  SpotifyVideoBackground <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/17.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case resize
    case resizeAspect
    case resizeAspectFill
}

open class VideoSplashViewController: UIViewController {

    
    override open func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override open func viewDidAppear(_ animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubview(toBack: moviePlayer.view)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate let moviePlayer = AVPlayerViewController()
    fileprivate var moviePlayerSoundLevel: Float = 1.0
    open var contentURL: URL? {
        didSet {
            setMoviePlayer(contentURL!)
        }
    }
    
    open var videoFrame: CGRect = CGRect()
    open var startTime: CGFloat = 0.0
    open var duration: CGFloat = 0.0
    open var backgroundColor: UIColor = UIColor.black {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    open var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    open var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    open var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NotificationCenter.default.addObserver(self,
                    selector: #selector(VideoSplashViewController.playerItemDidReachEnd),
                    name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                    object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    open var fillMode: ScalingMode = .resizeAspectFill {
        didSet {
            switch fillMode {
            case .resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .resizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .resizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    fileprivate func setMoviePlayer(_ url: URL) {
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as URL? {
                let priority = DispatchQueue.GlobalQueuePriority.default
                DispatchQueue.global(priority: priority).async {
                    DispatchQueue.main.async {
                        self.moviePlayer.player = AVPlayer(url: path)
                        self.moviePlayer.player?.play()
                        self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                    }
                }
            }
        }
    }

    func playerItemDidReachEnd() {
        moviePlayer.player?.seek(to: kCMTimeZero)
        moviePlayer.player?.play()
    }

}
