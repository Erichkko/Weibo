//
//  PopoverTitleUIPresentationController.swift
//  Weibo
//
//  Created by wanglong on 16/8/31.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class PopoverTitleUIPresentationController: UIPresentationController {
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
        print(presentedViewController)
    }
    
     override func containerViewWillLayoutSubviews(){
        
        // 1.修改弹出视图的大小
        //        containerView; // 容器视图
        //        presentedView() // 被展现的视图
        
        //添加背景,设置点击事件
        containerView?.insertSubview(bgView, atIndex: 0)
        
        //添加前景,显示对应的数据
       presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 300)
  
    }
    
    
   private lazy var bgView:UIView = {
        
        let bgView = UIView();
        bgView.frame = UIScreen.mainScreen().bounds
        bgView.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "closedVc")
        bgView.addGestureRecognizer(tapGesture)
        return bgView
        
    }()
 
     func closedVc(){
        // presentedViewController拿到当前弹出的控制器
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
