//
//  UIBarButtonItem+Category.swift
//  Weibo
//
//  Created by wanglong on 16/8/29.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    class func createCustomBarButtonItem(named:String
        , target: AnyObject?, action: Selector)->UIBarButtonItem{
            let btn = UIButton(type: UIButtonType.Custom)
            btn.setImage(UIImage(named: named), forState: UIControlState.Normal)
            btn.setImage(UIImage(named: named+"_highlighted"), forState: UIControlState.Highlighted)
            btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
            
            btn.sizeToFit()
            return UIBarButtonItem(customView: btn)
    }
}
