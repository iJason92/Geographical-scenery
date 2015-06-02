//
//  JPicture.swift
//  Geographical-scenery
//
//  Created by Jason on 1/6/15.
//  Copyright (c) 2015 Shepherd. All rights reserved.
//

import UIKit
/// 图片对象
class JPicture: NSObject {
    /// 图片标识
    var id : Int = 0
    /// 该图片属于哪个相册
    var albumid: String?
    /// 图片的标题
    var title : String?
    /// 图片的内容
    var content : String?
    /// 图片的URL
    var url : String?
    /// 图片的尺寸
    var size : String?
    /// 图片添加的时间
    var addtime: String?
    /// 图片的作者
    var author : String?
    /// 图片的缩略图URL
    var thumb : String?
    // 图片的编码类型
    var encoded : Int = 1
    /// 
    var weburl: String?
    /// 图片的类型
    var type : String?
    /// 图片在官网的指定链接
    var yourshotlink: String?
    /// 版权信息
    var copyright : String?
    /// md5 加密后的信息
    var pmd5 : String?
    /// 排列序号
    var sort : Int = 0
    
    // 初始化方法
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
}
