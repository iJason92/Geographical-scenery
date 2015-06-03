//
//  JHomeCollectionVC.swift
//  Geographical-scenery
//
//  Created by Jason on 31/5/15.
//  Copyright (c) 2015 Shepherd. All rights reserved.
//

import UIKit

private let reuseId = "JHomeCell"

class JHomeCollectionVC: UICollectionViewController {

    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 使用图片设置collectionView的背景色
        collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "bj")!)
    }
    // MARK: - UICollection的数据源方法
    
    // 每一组有多少个cell
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    // 每个cell的内容
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseId, forIndexPath: indexPath) as! JHomeCell
        return cell
    }
}

/***  图片概览的cell */
class JHomeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareLoad()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func awakeFromNib() {
        prepareLoad()
    }
    
    // 初始化视图
    private func prepareLoad() {
        // 图片
        // 背景色
        backgroundColor = UIColor.whiteColor()
        // 圆角
        layer.cornerRadius = 8
        layer.masksToBounds = true
        // 选中的背景视图
        let bgView = JCustomCellBg()
        selectedBackgroundView = bgView
    }
    /*** 日期 */
    @IBOutlet weak var dateLabel: UILabel!
    
    /** 相册缩略视图 */
    @IBOutlet weak var albumThumbView: UIImageView!
    
    /*** 是否已读缩略图 */
    @IBOutlet weak var readButton: UIButton!
}
