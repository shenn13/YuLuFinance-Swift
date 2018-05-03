
//
//  YLMyViewController.swift
//  YuLuFinance-Swift
//
//  Created by GuoMeng on 2018/5/2.
//  Copyright © 2018年 增光. All rights reserved.
//

import UIKit

class YLMyViewController: YLBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         setPresentBtn()
        // Do any additional setup after loading the view.
    }
    
    private func setPresentBtn(){
        let presentBtn = UIButton(frame:CGRect(x:10,y:64,width:adaptedWidth(width: 80),height:adaptedWidth(width: 30)))
        presentBtn.center = self.view.center
        presentBtn.setTitle("去登陆", for:.normal)
        presentBtn.backgroundColor = UIColor.yellow
        presentBtn.addTarget(self, action:#selector(presentBtnClicked(_:)), for: .touchUpInside)
        self.view.addSubview(presentBtn)
    }
    @objc func presentBtnClicked(_ button:UIButton){
       let loginVC = YLLoginViewController()
        self.present(loginVC, animated:true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
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
