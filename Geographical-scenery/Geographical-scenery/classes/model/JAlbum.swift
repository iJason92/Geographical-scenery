//
//  JAlbum.swift
//  Geographical-scenery
//
//  Created by Jason on 1/6/15.
//  Copyright (c) 2015 Shepherd. All rights reserved.
//

import UIKit

class JAlbum: NSObject {
    /// 一个相册中的的图片数量
    var counttotal : String?
    /// 相册中的图片
    var picture : JPicture?
    /// 初始化方法
    init(dict:[String:AnyObject]) {
        super.init()
        setValue(dict["counttotal"], forKey: "counttotal")
        if dict["picture"] != nil {
            picture = JPicture(dict: dict)
        }
    }
}
