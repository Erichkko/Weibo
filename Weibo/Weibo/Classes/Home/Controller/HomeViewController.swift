//
//  HomeViewController.swift
//  Weibo
//
//  Created by wanglong on 16/8/21.
//  Copyright © 2016年 wanglong. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var titleBtn:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化导航条的显示
        setupNav()
        //初始化中间显示内容
        setVistorInfo()
    }
    
    private func setupNav(){
        
        if isLogin{
            //设置左右2边的BarButtonItem
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.createCustomBarButtonItem("navigationbar_friendattention", target: self, action: "friendsFollow")
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.createCustomBarButtonItem("navigationbar_pop", target: self, action: "radar")
            //设置Title
            let titleView = TitleButton()
            titleView.setTitle("王龙的微博", forState: UIControlState.Normal)
            titleView.addTarget(self, action: "titleBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
            navigationItem.titleView = titleView;
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
        titleBtn = btn
        return UIBarButtonItem(customView: titleBtn!)
    }
    
    
    func friendsFollow(){
        print(__FUNCTION__)
    }
    
    
    func radar(){
        print(__FUNCTION__)
    }
    
    /**
     监听标题按钮点击
     :param: btn 标题按钮
     */
    func titleBtnClick(btn: TitleButton){
        btn.selected = !btn.selected
        print(__FUNCTION__)
        let storyboard = UIStoryboard(name: "PopoverTitle", bundle: nil)
        let popoverTitleVc =  storyboard.instantiateInitialViewController();
        // 2.1设置转场代理
        // 默认情况下modal会移除以前控制器的view, 替换为当前弹出的view
        // 如果自定义转场, 那么就不会移除以前控制器的view
        popoverTitleVc?.transitioningDelegate = self
        // 2.2设置转场的样式
        popoverTitleVc?.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(popoverTitleVc!, animated: true, completion: nil)
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

extension HomeViewController:UIViewControllerTransitioningDelegate{
      func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController?{
        return PopoverTitleUIPresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?{
        print("dismiss")
        if let titleBtnFinal = titleBtn{
            titleBtnFinal.selected = false
        }
        return nil
    }
}
