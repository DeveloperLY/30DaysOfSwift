//
//  VideoCutter.swift
//  SpotifyVideoBackground <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/17.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit
import AVFoundation

extension String {
    var convert: NSString {
        return (self as NSString)
    }
}

open class VideoCutter: NSObject {
    /**
     Block based method for crop video url
     
     @param videoUrl Video url
     @param startTime The starting point of the video segments
     @param duration Total time, video length
     
     */
    open func cropVideoWithUrl(videoUrl url: URL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath: URL?, _ error: NSError?) -> Void)?) {
        let priority = DispatchQueue.GlobalQueuePriority.default
        DispatchQueue.global(priority: priority).async {
            let asset = AVURLAsset(url: url, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            var outputURL = paths.object(at: 0) as! String
            let manager = FileManager.default
            do {
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            } catch _ {
            }
            outputURL = outputURL.convert.appendingPathComponent("output.mp4")
            do {
                try manager.removeItem(atPath: outputURL)
            } catch _ {
            }
            if let exportSession = exportSession as AVAssetExportSession? {
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileTypeMPEG4
                let start = CMTimeMakeWithSeconds(Float64(startTime), 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronously { () -> Void in
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed:
                        completion?(exportSession.outputURL, nil)
                    case AVAssetExportSessionStatus.failed:
                        print("Failed: \(exportSession.error)")
                    case AVAssetExportSessionStatus.cancelled:
                        print("Failed: \(exportSession.error)")
                    default:
                        print("default case")
                    }
                }
            }
            DispatchQueue.main.async {
            }
        }
    }
}
