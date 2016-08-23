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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
