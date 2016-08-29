//
//  MainNavViewController.swift
//  Weibo
//
//  Created by wanglong on 16/8/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class MainNavViewController: UINavigationController {

    
    //设置全局属性
    override func loadView() {
        super.loadView()
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
