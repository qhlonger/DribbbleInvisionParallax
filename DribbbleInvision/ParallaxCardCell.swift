//
//  ParallaxCardCell.swift
//  DribbbleInvision
//
//  Created by pingguo on 2018/5/6.
//  Copyright © 2018年 hl. All rights reserved.
//

import UIKit
import SnapKit
class ParallaxCardCell: UICollectionViewCell {
    lazy var iconView: UIImageView = {
        let icon = UIImageView()
        icon.clipsToBounds = true
        icon.contentMode = .scaleAspectFill
        icon.layer.cornerRadius = 20
        bgImgView.addSubview(icon)
        return icon
    }()
    lazy var iconShadowView: UIView = {
        let icon = UIView()
        icon.backgroundColor = .white
        icon.layer.cornerRadius = 20
        icon.layer.shadowColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.6).cgColor
        icon.layer.shadowRadius = 10
        icon.layer.shadowOpacity = 1
        
        bgImgView.addSubview(icon)
        return icon
    }()
    lazy var cardView: UIView = {
        let card = UIView()
        card.backgroundColor = .white
        
        card.clipsToBounds = true
        card.layer.cornerRadius = 15
        contentView.addSubview(card)
        return card
    }()
    lazy var cardShadowView: UIView = {
        let cardShadow = UIView()
        cardShadow.backgroundColor = .white
        cardShadow.layer.cornerRadius = 15
        cardShadow.layer.shadowColor = UIColor.init(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.6).cgColor
        cardShadow.layer.shadowRadius = 10
        cardShadow.layer.shadowOpacity = 1
//        cardShadow.layer.sha
        contentView.addSubview(cardShadow)
        return cardShadow
    }()
    
    lazy var bgImgView: UIImageView = {
        let bgImg = UIImageView()
        bgImg.contentMode = .scaleAspectFill
        bgImg.clipsToBounds = true
        cardView.addSubview(bgImg)
        return bgImg
    }()
    lazy var bgImgBgView: UIView = {
        let bgImgBg = UIView()
        bgImgBg.backgroundColor = UIColor.init(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        cardView.addSubview(bgImgBg)
        return bgImgBg
    }()
    lazy var bototmView: UIView = {
        let bottom = UIView()
        cardView.addSubview(bottom)
        return bottom
    }()
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = .black
        bototmView.addSubview(title)
        return title
    }()
    lazy var descLabel: UILabel = {
        let desc = UILabel()
        desc.font = UIFont.systemFont(ofSize: 14)
        desc.textColor = .lightGray
        desc.numberOfLines = 2
        bototmView.addSubview(desc)
        return desc
    }()
    var _ratio : CGFloat = 1
    var ratio: CGFloat {
        get {
            return _ratio;
        }
        set {
            _ratio = newValue
            calBgImgPositionByRatio()
            }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        doLayout()
        initCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override func prepareForReuse() {
        initCell()
    }
    func doLayout() {
        cardShadowView.frame = CGRect.init(x: 10, y: 10, width: self.bounds.width - 20, height: self.bounds.height - 20)
        cardView.frame = cardShadowView.frame
        
//        cardShadowView.snp.makeConstraints { (make) in
//            make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(20, 20, 20, 20))
//        }
//        cardView.snp.makeConstraints { (make) in
//            make.edges.equalTo(cardShadowView)
//        }
        bgImgBgView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo((cardView))
            make.height.equalTo(cardView.snp.width)
        }
        iconShadowView.snp.makeConstraints { (make) in
            
            make.width.height.equalTo(80)
            make.centerY.equalTo(bgImgView)
            make.centerX.equalTo(cardView)
        }
        iconView.snp.makeConstraints { (make) in
            make.edges.equalTo(iconShadowView)
        }
        bototmView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(cardView)
            make.top.equalTo(bgImgBgView.snp.bottom)
            
        }
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(cardView).offset(20)
            make.bottom.equalTo(bototmView.snp.centerY).offset(-5)
            make.right.lessThanOrEqualTo(cardView.snp.centerX).offset(-5)
        }
        descLabel.snp.makeConstraints { (make) in
            make.left.equalTo(cardView).offset(20)
            make.top.equalTo(bototmView.snp.centerY).offset(5)
            make.right.lessThanOrEqualTo(cardView.snp.right).offset(-20)
        }
    }
    func initCell() {
        bgImgView.image = nil
        iconView.image = nil
        titleLabel.text = nil
        descLabel.text = nil
        self.ratio = 0.5
    }
    func calBgImgPositionByRatio() {
        NSLog("%f",ratio)
        let parallaxW = cardView.bounds.width * 0.5
        let x = DIHelper.getEaseInMid(max: 0, min: -parallaxW*2, ratio: ratio)
//        cardView.bounds.width * ratio - parallaxW
        let y = 0
        let w = cardView.bounds.width + parallaxW * 2
        let h = cardView.bounds.width
        bgImgView.frame  = CGRect.init(x: x, y: CGFloat(y), width: w, height: h)
    }
    
    
}
