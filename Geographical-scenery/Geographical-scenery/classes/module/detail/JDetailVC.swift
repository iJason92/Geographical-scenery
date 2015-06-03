//
//  JDetailVC.swift
//  Geographical-scenery
//
//  Created by Jason on 3/6/15.
//  Copyright (c) 2015 Shepherd. All rights reserved.
//

import UIKit
private let reuseId = "JDetailCell"
class JDetailVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
//    override func viewWillAppear(animated: Bool) {
//        setLayout()
//    }
    override func viewWillLayoutSubviews() {
        println("\(view.frame)")
        println("\(collectionView.frame)")
        setLayout()
    }
    /// 设置collectionView的layout
    private func setLayout() {
        // UI还是暂时不要太纠结,先去做网络方法的吧
//        println("\(view.frame)")
//        println("\(collectionView.frame)")
        // cell的尺寸
        layout.itemSize = CGSizeMake(view.frame.width, collectionView.frame.height)
        // 最小cell间距
        layout.minimumInteritemSpacing = 0
        // 最小行间距
        layout.minimumLineSpacing = 0
        // 水平滚动
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        // 允许分页
        collectionView?.pagingEnabled = true
        // 水平滚动条不显示
        collectionView?.showsHorizontalScrollIndicator = false
        // 取消弹簧效果
        collectionView?.bounces = false
        // 成为代理
        collectionView.dataSource = self
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
    
    /// 屏幕旋转触发
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        setLayout()
    }
    // 隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // 返回home界面
    @IBAction func returnHomeBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
extension JDetailVC : UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseId, forIndexPath: indexPath) as! UICollectionViewCell
        
        return cell
    }
}
