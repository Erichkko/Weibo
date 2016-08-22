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
    override func loadView() {
      isLogin ? super.loadView() : setupVisitorView()
    }
    
    /**
     创建未登录状态的View
     */
    private func setupVisitorView(){
        let customView = VisitorView()
//        customView.backgroundColor = UIColor.purpleColor()
        view = customView
    }

}
