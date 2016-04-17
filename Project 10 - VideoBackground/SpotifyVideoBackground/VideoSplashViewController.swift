//
//  VideoSplashViewController.swift
//  SpotifyVideoBackground <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/17.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit
import MediaPlayer
import AVKit

public enum ScalingMode {
    case Resize
    case ResizeAspect
    case ResizeAspectFill
}

public class VideoSplashViewController: UIViewController {

    
    override public func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override public func viewDidAppear(animated: Bool) {
        moviePlayer.view.frame = videoFrame
        moviePlayer.showsPlaybackControls = false
        view.addSubview(moviePlayer.view)
        view.sendSubviewToBack(moviePlayer.view)
    }
    
    override public func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    private let moviePlayer = AVPlayerViewController()
    private var moviePlayerSoundLevel: Float = 1.0
    public var contentURL: NSURL = NSURL() {
        didSet {
            setMoviePlayer(contentURL)
        }
    }
    
    public var videoFrame: CGRect = CGRect()
    public var startTime: CGFloat = 0.0
    public var duration: CGFloat = 0.0
    public var backgroundColor: UIColor = UIColor.blackColor() {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    
    public var sound: Bool = true {
        didSet {
            if sound {
                moviePlayerSoundLevel = 1.0
            }else{
                moviePlayerSoundLevel = 0.0
            }
        }
    }
    
    public var alpha: CGFloat = CGFloat() {
        didSet {
            moviePlayer.view.alpha = alpha
        }
    }
    
    public var alwaysRepeat: Bool = true {
        didSet {
            if alwaysRepeat {
                NSNotificationCenter.defaultCenter().addObserver(self,
                    selector: "playerItemDidReachEnd",
                    name: AVPlayerItemDidPlayToEndTimeNotification,
                    object: moviePlayer.player?.currentItem)
            }
        }
    }
    
    public var fillMode: ScalingMode = .ResizeAspectFill {
        didSet {
            switch fillMode {
            case .Resize:
                moviePlayer.videoGravity = AVLayerVideoGravityResize
            case .ResizeAspect:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspect
            case .ResizeAspectFill:
                moviePlayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            }
        }
    }
    
    private func setMoviePlayer(url: NSURL) {
        let videoCutter = VideoCutter()
        videoCutter.cropVideoWithUrl(videoUrl: url, startTime: startTime, duration: duration) { (videoPath, error) -> Void in
            if let path = videoPath as NSURL? {
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        self.moviePlayer.player = AVPlayer(URL: path)
                        self.moviePlayer.player?.play()
                        self.moviePlayer.player?.volume = self.moviePlayerSoundLevel
                    }
                }
            }
        }
    }

    func playerItemDidReachEnd() {
        moviePlayer.player?.seekToTime(kCMTimeZero)
        moviePlayer.player?.play()
    }

}
