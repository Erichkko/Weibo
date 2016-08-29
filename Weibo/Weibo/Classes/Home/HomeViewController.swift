//
//  HomeViewController.swift
//  Weibo
//
//  Created by wanglong on 16/8/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //初始化导航条的显示
        setupNav()
        //初始化中间显示内容
        setVistorInfo()
    
    }
    
    private func setupNav(){
        
        if isLogin{
        
            self.navigationItem.leftBarButtonItem = createCustomBarButtonItem("navigationbar_friendattention", target: self, action: "friendsFollow")
            self.navigationItem.rightBarButtonItem = createCustomBarButtonItem("navigationbar_pop", target: self, action: "radar")
        }
    }
    
    private func setVistorInfo(){
        if !isLogin{
            if let vistorViewFinal = vistorView{
                vistorViewFinal.setupVistorInfo(true, imageName: "visitordiscover_feed_image_house", message: "首页")
            }
        }
    }
    
  
    
    private func createCustomBarButtonItem(named:String
    , target: AnyObject?, action: Selector)->UIBarButtonItem{
        let btn = UIButton(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: named), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: named+"_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
    
    
    func friendsFollow(){
        print(__FUNCTION__)
    }
    
    
    func radar(){
        print(__FUNCTION__)
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
