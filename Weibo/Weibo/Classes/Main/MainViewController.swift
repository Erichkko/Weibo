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
        
        //添加子控制器
        setupChilds()
    
    }
    
    private func setupTabbar(){
        self.tabBar.tintColor = UIColor.orangeColor()
    }
    
    private func setupChilds(){
    //
    //        //1.创建首页
    //        let homeVc = HomeViewController()
    //        addChildViewController(homeVc, title: "首页", normalImage: "tabbar_home", selectImage: "tabbar_home_highlighted")
    //
    //        //2.创建Message
    //        let messageVc = MessageViewController()
    //        addChildViewController(messageVc, title: "消息", normalImage: "tabbar_message_center", selectImage: "tabbar_message_center_highlighted")
    //
    //        //4.创建Discover
    //        let discoverVc = DiscoverViewController()
    //        addChildViewController(discoverVc, title: "发现", normalImage: "tabbar_discover", selectImage: "tabbar_discover_highlighted")
    //
    //        //5.创建ProFile
    //        let profileVc = ProfileViewController()
    //        addChildViewController(profileVc, title: "我", normalImage: "tabbar_profile", selectImage: "tabbar_profile_highlighted")
    
    
    //二.动态创建控制器
    //1获得Json路径
    let mainVcJsonPath = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
    //2,通过文件数据获得Json
    if let mainVcJsonPathFinal = mainVcJsonPath{
    let jsonData = NSData(contentsOfFile: mainVcJsonPathFinal);
    if let jsonDataFinal = jsonData{
    do{
    
    //3.将Json序列化->NSArray
    
    let jsonArray = try NSJSONSerialization.JSONObjectWithData(jsonDataFinal, options: NSJSONReadingOptions.MutableContainers);
    
    //4.根据Json数据创建子控制器
    for dict in jsonArray as! NSArray{
    print(dict)
    let imageName = dict["imageName"] as! String;
    let title = dict["title"] as! String;
    let vcName = dict["vcName"] as! String;
    addChildViewController(vcName , title: title, normalImage: imageName, selectImage: "\(imageName)_highlighted")
    }
    print(jsonArray)
    }catch{
        
    //抛出异常时 ,通过 本地手动创建子控制器
    print(error)
    
    //1.创建首页
    addChildViewController("HomeViewController", title: "首页", normalImage: "tabbar_home", selectImage: "tabbar_home_highlighted")
    
    //2.创建Message
    addChildViewController("MessageViewController", title: "消息", normalImage: "tabbar_message_center", selectImage: "tabbar_message_center_highlighted")
    
    //4.创建Discover
    addChildViewController("DiscoverViewController", title: "发现", normalImage: "tabbar_discover", selectImage: "tabbar_discover_highlighted")
    
    //5.创建ProFile
    addChildViewController("ProfileViewController", title: "我", normalImage: "tabbar_profile", selectImage: "tabbar_profile_highlighted")
    
    }
    }
    }
    

    }
//    /**
//     添加Tabbar 自控制器
//
//     - parameter childVc:     自控制器
//     - parameter title:       标题
//     - parameter normalImage: 默认图片
//     - parameter selectImage: 高亮图片
//     */
//    private func addChildViewController(childVc: UIViewController,title:String,normalImage:String,selectImage:String) {
//        //抽取方法
//        childVc.title = title
//        childVc.tabBarItem.image = UIImage(named: normalImage)
//        childVc.tabBarItem.selectedImage = UIImage(named: selectImage)
//        let nav = MainNavViewController(rootViewController: childVc)
//        self.addChildViewController(nav)
//    }
    
    private func addChildViewController(childVcName: String,title:String,normalImage:String,selectImage:String) {
        
        
        //动态获得命名空间
        let targetName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        //获得对应类的命名空间
        let cls:AnyClass? = NSClassFromString(targetName + "." + childVcName)
        //把AnyClass 强制转换 为ViewController
        let vcCls = cls as! UIViewController.Type
        //创建对象
        let childVc = vcCls.init()
    
        
        //抽取方法
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: normalImage)
        childVc.tabBarItem.selectedImage = UIImage(named: selectImage)
        let nav = MainNavViewController(rootViewController: childVc)
        self.addChildViewController(nav)
    }

}
