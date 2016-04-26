//
//  AnimationCellModel.swift
//  CollectionViewAnimation <https://github.com/CoderYLiu/30DaysOfSwift>
//
//  Created by Liu Y on 16/4/26.
//  Copyright © 2016年 CoderYLiu. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

struct AnimationCellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}
