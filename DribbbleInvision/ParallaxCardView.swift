//
//  ParallaxCardView.swift
//  DribbbleInvision
//
//  Created by pingguo on 2018/5/6.
//  Copyright © 2018年 hl. All rights reserved.
//

import UIKit

class ParallaxCardView: UIView {

    
    lazy var collectionView: UICollectionView = {
        let flowLayout = CardFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let col = UICollectionView.init(frame: self.bounds, collectionViewLayout: flowLayout)
        col.register(ParallaxCardCell.self, forCellWithReuseIdentifier: "ParallaxCardCell")
        col.delegate = self
        col.dataSource = self
//        col.isPagingEnabled = true
        col.clipsToBounds = false
//        col.decelerationRate = 0.99
        col.backgroundColor = .white
        col.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.addSubview(col)
        return col
    }()
    lazy var dataArray: NSArray = {
        
        let diaryList:String = Bundle.main.path(forResource: "data", ofType:"plist")!
        let data:NSArray = NSArray(contentsOfFile:diaryList)!
        return data
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self).inset(UIEdgeInsetsMake(0, 0, 0, 0))
//        make.top.bottom.left.equalTo(self)
//            make.width.equalTo(self).multipliedBy(0.95)
        }
        
        
        
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layoutCell(cell :ParallaxCardCell) {
        let minX = -collectionView.bounds.width
        let maxX = collectionView.bounds.width * 2
        
        let rect = collectionView.convert(cell.frame, to: self)
        let midX = rect.midX
        //0-1
        let ratio = DIHelper.getLinearRatio(max: maxX, min: minX, mid: midX)
//        ratio -= 0.5
        cell.ratio = ratio
    }
    func layoutVisableCell() {
        for cell in collectionView.visibleCells {
            layoutCell(cell: cell as! ParallaxCardCell)
        }
    }

}

extension ParallaxCardView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = self.bounds.width * 0.9
        let h = w * 1.3
        
        return CGSize.init(width: w, height: h)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ParallaxCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ParallaxCardCell", for: indexPath) as! ParallaxCardCell
        
        let dic : NSDictionary = dataArray[indexPath.item] as! NSDictionary
        cell.bgImgView.image = UIImage.init(named: dic.object(forKey: "bgimg") as! String)
        cell.iconView.image = UIImage.init(named: dic.object(forKey: "icon")! as! String)
        cell.titleLabel.text = dic.object(forKey: "title") as? String
        cell.descLabel.text = dic.object(forKey: "desc") as? String
        
        
        layoutCell(cell: cell)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        layoutCell(cell: cell as! ParallaxCardCell)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        layoutVisableCell()
    }
    
}
