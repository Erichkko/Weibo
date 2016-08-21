//
//  AppDelegate.swift
//  Weibo
//
//  Created by wanglong on 16/8/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //1.创建window
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //2.设置跟控制器
        let vc =  MainViewController()
        vc.view.backgroundColor = UIColor.redColor()
        self.window?.rootViewController = vc
        
        //3.显示根控制器
        self.window?.makeKeyAndVisible()
        return true
    }

}

