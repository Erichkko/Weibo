//
//  BaseViewController.swift
//  Weibo
//
//  Created by wanglong on 16/8/22.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    var isLogin = false
    var vistorView:VisitorView?
    override func loadView() {
      isLogin ? super.loadView() : setupVisitorView()
    }
    
    /**
     创建未登录状态的View
     */
    private func setupVisitorView(){
        
        
        //1.初始化未登录界面
        let customView = VisitorView()
        customView.deleagte = self
        vistorView = customView
        view = vistorView
        
        //设置导航条的布局
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Done, target: self, action: "loginCallback")
        
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Done, target: self, action: "registerCallback")
    }
    
}
extension BaseViewController:VisitorViewDelegate{
    func loginCallback() {
        print("登录操作的处理")
    }
    func registerCallback() {
        print("注册操作的处理")
    }
}