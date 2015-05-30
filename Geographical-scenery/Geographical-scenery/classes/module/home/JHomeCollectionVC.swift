//
//  JHomeCollectionVC.swift
//  Geographical-scenery
//
//  Created by Jason on 31/5/15.
//  Copyright (c) 2015 Shepherd. All rights reserved.
//

import UIKit

let reuseId = "JHomeCell"

class JHomeCollectionVC: UICollectionViewController {

    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 使用图片设置collectionView的背景色
        collectionView?.backgroundColor = UIColor(patternImage: UIImage(named: "bj")!)
    }
    
    override func viewWillLayoutSubviews() {
        // 屏幕高度
        let screenH = UIScreen.mainScreen().bounds.height
        // 屏幕宽度
        let screenW = UIScreen.mainScreen().bounds.width
//        layout.itemSize = CGSizeMake((screenW - 2 * 36) / 3.5 , (screenH - 2 * 36) / 3.5)
        layout.itemSize = CGSizeMake(250, 190)
        layout.minimumInteritemSpacing = 36  // cell之间的间距
        layout.minimumLineSpacing = 36       // 行间距
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
    
    // MARK: - UICollection的数据源方法
    
    // 每一组有多少个cell
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 22
    }
    
    // 每个cell的内容
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseId, forIndexPath: indexPath) as! JHomeCell
        
        return cell
    }
}

/***  图片概览的cell */
class JHomeCell: UICollectionViewCell {
    
    // 相册缩略视图
    @IBOutlet weak var albumThumbView: UIImageView!
    
    // 是否已读缩略图
    @IBOutlet weak var readButton: UIButton!
}
