//
//  JCustomCellBg.swift
//  Geographical-scenery
//
//  Created by Jason on 3/6/15.
//  Copyright (c) 2015 Shepherd. All rights reserved.
//

import UIKit
import CoreGraphics
import QuartzCore
// 选中cell的背景控制器
class JCustomCellBg: UIView {
     override func drawRect(rect: CGRect) {
        let aRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(aRef)
        // 绘制圆角
        var bezierPath = UIBezierPath(roundedRect: rect, cornerRadius: 8.0)
        // 线宽
        bezierPath.lineWidth = 8.0
        UIColor.whiteColor().setStroke()
        // 填充色
        let fillColor = UIColor(red: 0.529, green: 0.808, blue: 0.922, alpha: 1)
        fillColor.setFill()
        bezierPath.stroke()
        bezierPath.fill()
        CGContextRestoreGState(aRef)
    }
}
