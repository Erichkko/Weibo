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
        
        
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let vc =  ViewController()
        
        vc.view.backgroundColor = UIColor.redColor()
        self.window?.rootViewController = vc
        
        self.window?.makeKeyAndVisible()
        return true
    }

}

