//
//  TitleButton.swift
//  Weibo
//
//  Created by wanglong on 16/8/29.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.font = UIFont.systemFontOfSize(17)
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Selected)
        self.setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        self.setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.sizeToFit()
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width + 5
    }

}
