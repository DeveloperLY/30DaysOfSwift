//
//  ViewController.swift
//  ImageScrollerEffect <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/15.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var imageView: UIImageView!
    var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "Steve"))
        
        setUpScrollView()
        setZoomScaleFor(scrollView.bounds.size)
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setZoomScaleFor(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    fileprivate func setUpScrollView() {
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.backgroundColor = UIColor.clear
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self;
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    fileprivate func setZoomScaleFor(_ srollViewSize: CGSize) {
        let imageSize = imageView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heightScale = srollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minimunScale;
        scrollView.maximumZoomScale = 3.0
    }
    
    fileprivate func recenterImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        self.recenterImage()
    }

}

