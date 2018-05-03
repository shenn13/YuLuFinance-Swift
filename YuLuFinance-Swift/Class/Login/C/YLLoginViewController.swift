//
//  YLLoginViewController.swift
//  YuLuFinance-Swift
//
//  Created by GuoMeng on 2018/5/2.
//  Copyright © 2018年 增光. All rights reserved.
//

import UIKit


class YLLoginViewController: YLBaseViewController {
    var underLinebutton = UnderLineButtonView()
    var accountTF = YJJTextField()
    var passWordTF = YJJTextField()
    var userLoginBtn = UIButton()
    var serviceLoginBtn = UIButton()
    var codeWordTF = YJJTextField()
    var codeBtn = UIButton()
    var setPassWordTF = YJJTextField()
    var registerBtn = UIButton()
    var agreeBtn = UIButton()
    var verificationCode = NSString()
    var codeDic = NSDictionary()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoginView()
        // Do any additional setup after loading the view.
    }
    private func setLoginView(){
        let headerImageView = UIImageView()
        headerImageView.frame = CGRect(x:0,y:0,width:kScreenWidth,height:adaptedHeight(height: 120))
        headerImageView.backgroundColor = UIColor(hexString:"#2aa3c1")
        self.view.addSubview(headerImageView)
        
        let logoImageView = UIImageView()
        logoImageView.frame = CGRect(x:(kScreenWidth - adaptedWidth(width: 100))/2,y:adaptedHeight(height: 84),width:adaptedWidth(width:100),height:adaptedWidth(width:100))
        logoImageView.centerY = headerImageView.maxY
        logoImageView.image = UIImage(named:"YuLuFinanceIconLogo")
        self.view.addSubview(logoImageView)
        
        
        let closeBtn = UIButton(frame:CGRect(x:(kScreenWidth - adaptedWidth(width: 22) - 20),y:UIDevice.current.isX() ? 44 : 24,width:adaptedWidth(width: 22),height:adaptedWidth(width: 22)))
        closeBtn.setImage(UIImage(named:"discover_cancle"), for: .normal)
        closeBtn.addTarget(self, action:#selector(closeBtnClicked(_:)), for: .touchUpInside)
        self.view.addSubview(closeBtn)
        
        let underLinebutton = UnderLineButtonView.init(items:["登录","注册"])
        underLinebutton?.frame = CGRect(x:0,y:logoImageView.maxY + adaptedHeight(height: 20),width:kScreenWidth,height:40)
        underLinebutton?.addTarget(self, action: #selector(accountBtnSendAction(_:)))
        self.view.addSubview(underLinebutton!)
        self.underLinebutton = underLinebutton!
        
        let accountTF = YJJTextField.yjj_()
        accountTF?.frame = CGRect(x:10,y:(underLinebutton?.maxY)! + adaptedHeight(height: 20),width:kScreenWidth - 20,height:60)
        accountTF?.maxLength = 11;
        accountTF?.errorStr = "不得超过11位";
        accountTF?.placeholder = "请输入账号";
        accountTF?.textField.keyboardType = UIKeyboardType.numberPad;
        self.view.addSubview(accountTF!)
        self.accountTF = accountTF!
        
        let passWordTF = YJJTextField.yjj_()
        passWordTF?.frame = CGRect(x:10,y:(accountTF?.maxY)! + adaptedHeight(height: 10),width:kScreenWidth - 20,height:60)
        passWordTF?.maxLength = 20;
        passWordTF?.errorStr = "密码不得超过20位";
        passWordTF?.placeholder = "请输入登录密码";
        passWordTF?.textField.keyboardType = UIKeyboardType.asciiCapable;
        self.view.addSubview(passWordTF!)
        self.passWordTF = passWordTF!
        
        let userLoginBtn = UIButton()
        userLoginBtn.frame = CGRect(x:10,y:(passWordTF?.maxY)! + adaptedHeight(height: 30),width:(kScreenWidth - 30)/2,height:40)
        userLoginBtn.backgroundColor = kHomeBarColor
        userLoginBtn.setTitle("用户登录", for:.normal)
        userLoginBtn.setTitleColor(UIColor(hexString:"#ffffff"), for: .normal)
        userLoginBtn.layer.cornerRadius = 5
        userLoginBtn.clipsToBounds = true
        userLoginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        userLoginBtn.addTarget(self, action: #selector(userLoginBtnClicked(_:)), for:.touchUpInside)
        self.view.addSubview(userLoginBtn)
        self.userLoginBtn = userLoginBtn
        
        let serviceLoginBtn = UIButton()
        serviceLoginBtn.frame = CGRect(x:userLoginBtn.maxX + 10,y:(passWordTF?.maxY)! + adaptedHeight(height: 30),width:(kScreenWidth - 30)/2,height:40)
        serviceLoginBtn.backgroundColor = kHomeBarColor
        serviceLoginBtn.setTitle("客服登录", for:.normal)
        serviceLoginBtn.setTitleColor(UIColor(hexString:"#ffffff"), for: .normal)
        serviceLoginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        serviceLoginBtn.layer.cornerRadius = 5
        serviceLoginBtn.clipsToBounds = true
        serviceLoginBtn.addTarget(self, action: #selector(serviceLoginBtnClicked(_:)), for:.touchUpInside)
        self.view.addSubview(serviceLoginBtn)
        self.serviceLoginBtn = serviceLoginBtn
        
        let codeWordTF = YJJTextField.yjj_()
        codeWordTF?.frame = CGRect(x:10,y:(accountTF?.maxY)! + adaptedHeight(height: 10),width:kScreenWidth - 140,height:60)
        codeWordTF?.maxLength = 6;
        codeWordTF?.errorStr = "不得超过6位";
        codeWordTF?.placeholder = "请输入验证码";
        codeWordTF?.isHidden = true
        codeWordTF?.textField.keyboardType = UIKeyboardType.phonePad
        self.view.addSubview(codeWordTF!)
        self.codeWordTF = codeWordTF!
        
        let codeBtn = UIButton()
        codeBtn.frame = CGRect(x:(codeWordTF?.maxX)! + 10,y:(accountTF?.maxY)! + adaptedHeight(height: 10),width:100,height:40)
        codeBtn.backgroundColor = kHomeBarColor
        codeBtn.setTitle("获取验证码", for:.normal)
        codeBtn.setTitleColor(UIColor(hexString:"#ffffff"), for: .normal)
        codeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        codeBtn.layer.cornerRadius = 5
        codeBtn.clipsToBounds = true
        codeBtn.isHidden = true
        codeBtn.addTarget(self, action: #selector(codeBtnClicked(_:)), for:.touchUpInside)
        self.view.addSubview(codeBtn)
        self.codeBtn = codeBtn
        
        let setPassWordTF = YJJTextField.yjj_()
        setPassWordTF?.frame = CGRect(x:10,y:(codeWordTF?.maxY)! + adaptedHeight(height: 5),width:kScreenWidth - 20,height:60)
        setPassWordTF?.maxLength = 20;
        setPassWordTF?.errorStr = "密码不得超过20位";
        setPassWordTF?.placeholder = "请设置登录密码";
        setPassWordTF?.isHidden = true
        setPassWordTF?.textField.isSecureTextEntry = true
        setPassWordTF?.textField.keyboardType = UIKeyboardType.asciiCapable
        self.view.addSubview(setPassWordTF!)
        self.setPassWordTF = setPassWordTF!
        
        let agreeBtn = UIButton()
        agreeBtn.frame = CGRect(x:10,y:(setPassWordTF?.maxY)!,width:250,height:30)
        agreeBtn.setTitle("我已阅读并同意《借款服务协议》", for: .normal)
        agreeBtn.setTitleColor(UIColor.black, for:.normal)
        agreeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        agreeBtn.setImage(UIImage(named:"my_auth_no_selet"), for: .normal)
        agreeBtn.setImage(UIImage(named:"my_auth_yes_selet"), for: .selected)
        agreeBtn.setImagePositionWith(ImagePositionType.left, spacing: 10)
        agreeBtn.isHidden = true
        agreeBtn.addTarget(self, action: #selector(agreeBtnCliclked(_:)), for: .touchUpInside)
        self.view.addSubview(agreeBtn)
        self.agreeBtn = agreeBtn
        
        let registerBtn = UIButton()
        registerBtn.frame = CGRect(x:10,y:(setPassWordTF?.maxY)! + adaptedHeight(height: 40),width:kScreenWidth - 20,height:40)
        if agreeBtn.isSelected {
            registerBtn.backgroundColor = kHomeBarColor
        }else{
            registerBtn.backgroundColor = UIColor(hexString:"#969696")
        }
        registerBtn.setTitle("注册", for:.normal)
        registerBtn.setTitleColor(UIColor(hexString:"#ffffff"), for: .normal)
        registerBtn.layer.cornerRadius = 5
        registerBtn.clipsToBounds = true
        registerBtn.isHidden = true
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        registerBtn.addTarget(self, action: #selector(registerBtnClicked(_:)), for:.touchUpInside)
        self.view.addSubview(registerBtn)
        self.registerBtn = registerBtn
        
    }
    
    @objc func userLoginBtnClicked (_ button:UIButton){
        
    }
    @objc func serviceLoginBtnClicked (_ button:UIButton){
        
    }
    @objc func codeBtnClicked (_ button:UIButton){
        
    }
    @objc func agreeBtnCliclked (_ button:UIButton){
        if !self.agreeBtn.isSelected {
            let naVC = YLNavigationViewController.init(rootViewController:YLRegisterAgreementViewController())
            self.present(naVC, animated: true, completion: {
                button.isSelected = !button.isSelected
                self.registerBtn.backgroundColor = kHomeBarColor
            })
        }else{
            button.isSelected = !button.isSelected
            self.registerBtn.backgroundColor = UIColor(hexString:"#969696")
        }
        
    }
    @objc func registerBtnClicked (_ button:UIButton){
        
    }
    @objc func accountBtnSendAction(_ button:UIButton){
        let index = button.tag - 1000
        if index == 0 {
            self.passWordTF.isHidden = false
            self.userLoginBtn.isHidden = false
            self.serviceLoginBtn.isHidden = false;

            self.codeBtn.isHidden = true
            self.codeWordTF.isHidden = true
            self.setPassWordTF.isHidden = true
            self.registerBtn.isHidden = true
            self.agreeBtn.isHidden = true;
        }
        if index == 1 {
            self.passWordTF.isHidden = true
            self.userLoginBtn.isHidden = true
            self.serviceLoginBtn.isHidden = true;
            
            self.codeWordTF.isHidden = false
            self.codeBtn.isHidden = false
            self.setPassWordTF.isHidden = false
            self.registerBtn.isHidden = false
            self.agreeBtn.isHidden = false;
        }
    }
    @objc func closeBtnClicked(_ button:UIButton){
        self.dismiss(animated: true, completion: nil)
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
