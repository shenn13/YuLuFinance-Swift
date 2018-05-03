//
//  YLBaseViewController.swift
//  YuLuFinance-Swift
//
//  Created by GuoMeng on 2018/5/2.
//  Copyright © 2018年 增光. All rights reserved.
//

import UIKit

class YLBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationColor()
        // Do any additional setup after loading the view.
    }
    
    private func customNavigationColor(){
        //修改导航栏按钮颜色
        self.navigationController?.navigationBar.tintColor = UIColor.black
        //修改导航栏背景色
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        //修改导航栏文字颜色
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.black]
        
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
