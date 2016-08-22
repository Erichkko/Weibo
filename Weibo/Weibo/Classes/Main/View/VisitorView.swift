//
//  VisitorView.swift
//  Weibo
//
//  Created by wanglong on 16/8/22.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    
    //创建背景图片
    private lazy var bgView:UIImageView = {
        let image = UIImage(named: "visitordiscover_feed_image_smallicon")
        let bgView = UIImageView(image: image)
//        bgView.backgroundColor = UIColor.redColor()
        return bgView;
    }()
    
    //创建Icon
    private lazy var iconView:UIImageView = {
        let image = UIImage(named: "visitordiscover_feed_image_house")
        let iconView = UIImageView(image: image)
        //        bgView.backgroundColor = UIColor.redColor()
        return iconView;
        
    }()
    
    //创建Label
    private lazy var msgLabel:UILabel = {
        let msgLabel = UILabel()
        msgLabel.numberOfLines = 0
        msgLabel.text = "登录微博,查看更多精彩内容...登录微博,查看更多精彩内容...登录微博,查看更多精彩内容..."
        msgLabel.textColor = UIColor.darkGrayColor()
//        msgLabel.font = UIFont().fontWithSize(12)
        return msgLabel
    }()
    
    //创建LoginButton
    private lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(type: UIButtonType.Custom)
        loginBtn.setTitle("登录", forState: UIControlState.Normal)
        loginBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        loginBtn.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
        return loginBtn
    }()
    
    //创建RegisterButton
    private lazy var regBtn: UIButton = {
        let regBtn = UIButton(type: UIButtonType.Custom)
        regBtn.setTitle("注册", forState: UIControlState.Normal)
        regBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        regBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        return regBtn
    }()
    
    
    
    //创建maskBgView
    private lazy var maskBgView:UIImageView = {
        let image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        let maskBgView = UIImageView(image: image)
        //        bgView.backgroundColor = UIColor.redColor()
        return maskBgView;
        
    }()
    //手动new创建代码
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.backgroundColor = UIColor.whiteColor()
        
        //1.添加子控件
        self.addSubview(bgView)
        self.addSubview(maskBgView)
        self.addSubview(iconView)
        self.addSubview(msgLabel)
        self.addSubview(loginBtn)
        self.addSubview(regBtn)
        
        //2.布局子控件
        bgView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        iconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        
        //设置Label的约束 比较复杂 ,要设置2个属性
        msgLabel.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: bgView, size: nil)
        let consWidth = NSLayoutConstraint(item: msgLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 240.0)
        addConstraint(consWidth)
        
        loginBtn.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: msgLabel, size: CGSize(width: 100, height: 30),offset: CGPoint(x: 0, y: 5))
        regBtn.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: msgLabel, size: CGSize(width: 100, height: 30),offset: CGPoint(x: 0, y: 5))
        maskBgView.xmg_Fill(self)
    }
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        bgView.center = self.center
//        iconView.center = self.center
//        msgLabel.center = self.center
//        loginBtn.center = self.center
//    }
    
    //Swift推荐我们自定义一个控件,要么用纯代码,要么用XIB/StoryBoard
    required init?(coder aDecoder: NSCoder) {
        //如果使用了xib/storyboard创建该类,那么程序就会崩溃
        fatalError("init(coder:) has not been implemented")
    }

}
