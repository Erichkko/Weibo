//
//  MainViewController.swift
//  Weibo
//
//  Created by wanglong on 16/8/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置tabbar属性
        setupTabbar()
        
        //1.创建首页
        let homeVc = HomeViewController()
        addChildViewController(homeVc, title: "首页", normalImage: "tabbar_home", selectImage: "tabbar_home_highlighted")
        
        //2.创建Message
        let messageVc = MessageViewController()
        addChildViewController(messageVc, title: "消息", normalImage: "tabbar_message_center", selectImage: "tabbar_message_center_highlighted")
        
        //4.创建Discover
        let discoverVc = DiscoverViewController()
        addChildViewController(discoverVc, title: "发现", normalImage: "tabbar_discover", selectImage: "tabbar_discover_highlighted")
        
        //5.创建ProFile
        let profileVc = ProfileViewController()
        addChildViewController(profileVc, title: "我", normalImage: "tabbar_profile", selectImage: "tabbar_profile_highlighted")
    
    }
    
    private func setupTabbar(){
        self.tabBar.tintColor = UIColor.orangeColor()
    }
    /**
     添加Tabbar 自控制器
     
     - parameter childVc:     自控制器
     - parameter title:       标题
     - parameter normalImage: 默认图片
     - parameter selectImage: 高亮图片
     */
    private func addChildViewController(childVc: UIViewController,title:String,normalImage:String,selectImage:String) {
        //抽取方法
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: normalImage)
        childVc.tabBarItem.selectedImage = UIImage(named: selectImage)
        let nav = MainNavViewController(rootViewController: childVc)
        self.addChildViewController(nav)
    }

}
