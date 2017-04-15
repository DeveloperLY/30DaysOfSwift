//
//  AnimationImageCollection.swift
//  CollectionViewAnimation <https://github.com/DeveloperLY/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/26.
//  Copyright © 2016年 DeveloperLY. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

struct AnimationImageCollection {
    fileprivate let imagePaths = ["1", "2", "3", "4", "5"]
    var images: [AnimationCellModel]
    
    init() {
        images = imagePaths.map { AnimationCellModel(imagePath: $0) }
    }
}
