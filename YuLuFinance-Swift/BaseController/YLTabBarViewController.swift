//
//  YLTabBarViewController.swift
//  YuLuFinance-Swift
//
//  Created by GuoMeng on 2018/5/2.
//  Copyright © 2018年 增光. All rights reserved.
//

import UIKit

class YLTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setAllChildViewController()
        
        // Do any additional setup after loading the view.
    }

    private func setAllChildViewController(){
        
        addChildViewController(childController: YLHomePageViewController(), title: "首页", imageName: "tabbar_home_normal", selectImageName: "tabbar_home_select")
        addChildViewController(childController: YLFriendsListViewController(), title: "好友", imageName: "tabbar_friends_normal", selectImageName: "tabbar_friends_select")
        addChildViewController(childController: YLDiscoverViewController(), title: "贷款超市", imageName: "tabbar_discover_normal", selectImageName: "tabbar_discover_select")
        addChildViewController(childController: YLMyViewController(), title: "我的", imageName: "tabbar_my_normal", selectImageName: "tabbar_my_select")
        
    }
    
    private func addChildViewController(childController: UIViewController, title:String,imageName:String,selectImageName:String) {
        childController.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage  = UIImage(named:selectImageName)
        addChildViewController(YLNavigationViewController(rootViewController:childController))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
