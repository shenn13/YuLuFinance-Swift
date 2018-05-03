//
//  Api.h
//  YuLuFinance-Swift
//
//  Created by GuoMeng on 2018/5/2.
//  Copyright © 2018年 增光. All rights reserved.
//

import Foundation

let api = Api()

struct Api {
    
    // 公共地址
    let HEADURL = "https://www.zhouluhao.com/liou/api/"
    
    //加载图片请求头
    let PICHEADURL = "https://www.zhouluhao.com/liou"
    //默认头像
    let PlaceholderImageURL = "https://www.zhouluhao.com/liou/image/common/default_headicon.png"
    
    let fileUploadUrl = "https://www.zhouluhao.com/liou/api/FileUpload"
    
    /**
     *2.用户注册
     获取注册信息
     */
    let userRegisterUrl  = "UserRegister"
    /**
     *3. 用户登录
     获取登录信息
     */
    let userLoginUrl  =  "UserLogin"
    
    /**
     *4. 用户信息获取
     获取用户信息
     */
    let getUserInfoUrl  = "GetUserInfo"
    
    /**
     *5. 用户身份认证
     上传用户信息
     */
    let identityVerifyUrl  = "IdentityVerify"
    
    /**
     *6. 用户联系人认证
     上传用户信息
     */
    let contactVerifyUrl  = "ContactVerify"
    
    /**
     *7. 用户运营商认证
     运营商认证
     */
    let operatorVerifyUrl  = "OperatorVerify"
    
    /**
     *8. 用户借贷记录
     借贷记录
     */
    let GetMyLoadUrl  = "GetMyLoadApply"
    
    /**
     *9. 借贷产品
     发现模块
     */
    let getProductUrl  = "GetProduct"
    
    /**
     *10. 借贷申请
     申请借贷接口
     */
    let ApplyLoanUrl  = "ApplyLoan"
    
    /**
     *11. 获取已认证联系人
     获取联系人
     */
    let GetVerifiedContactUrl  = "GetVerifiedContact"
    
    /**
     *12. 取得借贷记录明细
     取得借贷记录明细
     */
    let GetMyLoadDetailUrl  = "GetMyLoadApplyDetail"
    
    /**
     *13. 查找好友
     */
    let SearchFriendUrl  = "SearchFriend"
    
    /**
     *14. 申请好友
     */
    let ApplyFriendUrl  = "ApplyFriend"
    
    /**
     *15. 取得好友
     */
    let GetFriendsUrl  = "GetFriends"
    
    /**
     *16. 接受申请
     */
    let AcceptFriendUrl  = "AcceptFriend"
    
    /**
     *17. 更新头像
     */
    let UpdateHeadiconUrl  = "UpdateHeadicon"
    
    /**
     *18. 客服登录
     */
    let CusSerLoginUrl  = "CusSerLogin"
    
    /**
     *19. 查找好友
     */
    let SearchFriend2Url  = "SearchFriend2"
    
    /**
     *20. 好友申请
     */
    let ApplyFriend2Url  = "ApplyFriend2"
    
    /**
     *21. 获得好友
     */
    let GetFriends2Url  = "GetFriends2"
    
    /**
     *22.接受好友申请
     */
    let AcceptFriend2Url  = "AcceptFriend2"
    
    /**
     *23.借条数据上传
     */
    let InputIouUrl  = "InputIou"
    
    /**
     *24.取得借条信息（聊天界面）
     */
    let GetIouProtocolUrl  = "GetIouProtocol"
    
    /**
     *25.更新借条状态
     */
    let UpdateIouStatusUrl  = "UpdateIouStatus"
    
    /**
     *26.电子凭证（欠条）签署 用户
     */
    let UserSignVoucherUrl  = "UserSignVoucher"
    
    /**
     *27.电子凭证（欠条）签署 客服
     */
    let CusSerSignVoucherUrl  = "CusSerSignVoucher"
    
    /**
     *28.取得借条
     */
    let GetIOUUrl  = "GetIOU"
    /**
     *29.取得借条详细
     */
    let GetIOUDetailUrl  = "GetIOUDetail"
    
    /**
     *30.客服专属流量信息取得
     */
    let GetCusSerFluxUrl  = "GetCusSerFlux"
    
}

