//
//  System.swift
//  YuLuFinance-Swift
//
//  Created by GuoMeng on 2018/5/2.
//  Copyright © 2018年 增光. All rights reserved.
//

import Foundation

// 屏幕宽
public let kScreenWidth = CGFloat(UIScreen.main.bounds.size.width)
// 屏幕高
public let kScreenHeight = CGFloat(UIScreen.main.bounds.size.height)

//屏幕分辨率比例
let screenScale:CGFloat = UIScreen.main.responds(to: #selector(getter: UIScreen.main.scale)) ? UIScreen.main.scale : 1.0
//不同屏幕尺寸字体适配（375，667是因为目前苹果开发一般用IPHONE6做中间层 如果不是则根据实际情况修改） 相对于iPhone6的宽度比例
let screenWidthRatio:CGFloat =  CGFloat(kScreenWidth / 375);
let screenHeightRatio:CGFloat = CGFloat(kScreenHeight / 667);
//根据传入的值算出乘以比例之后的值
func adaptedWidth(width:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(width))) * screenWidthRatio
}
func adaptedHeight(height:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(height))) * screenHeightRatio
}

// 导航高
public let kNavHeight = 64
// Tabbar高
public let kTabHeight = 49

public let kHomeBarColor = UIColor.colorWith(77, green: 123, blue: 254, alpha: 1)

public let kOtherBarColor = UIColor.colorWith(246, green: 246, blue: 246, alpha: 1)

//判断是不是iPhoneX
extension UIDevice {
    public func isX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
}

//判断是那种设备
/*
 4  4s
 */
func iPhone4() ->Bool {
    return UIScreen.main.bounds.size.height == 480.0
}
/*
 5  5s
 */
func iPhone5() ->Bool {
    return UIScreen.main.bounds.size.height == 568.0
}
/*
 6  6s  7
 */
func iPhone6() ->Bool {
    return UIScreen.main.bounds.size.height == 667.0
}
/*
 6plus  6splus  7plus
 */
func iPhone6plus() ->Bool {
    return UIScreen.main.bounds.size.height == 736.0
}

// UIColor的扩展-RGBA&HEX
extension UIColor {
    class func colorWith(_ red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}



///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  App Version / Info Plist  设备系统版本
//
///////////////////////////////////////////////////////////////////////////////////////////////////

/* 设备系统相关  */
let kiOSVersion:String        = UIDevice.current.systemVersion         /* iOS系统版本 */
let osType:String             = UIDevice.current.systemName + UIDevice.current.systemVersion

/* app版本  以及设备系统版本 */
let infoDictionary            = Bundle.main.infoDictionary
let kAppName: String?         = infoDictionary!["CFBundleDisplayName"] as? String        /* App名称 */
let kAppVersion: String?      = infoDictionary!["CFBundleShortVersionString"] as? String /* App版本号 */
let kAppBuildVersion: String? = infoDictionary!["CFBundleVersion"] as? String            /* Appbuild版本号 */
let kAppBundleId: String?     = infoDictionary!["CFBundleIdentifier"] as? String                 /* app bundleId */
let platformName: String?     = infoDictionary!["DTPlatformName"] as? String  //平台名称（iphonesimulator 、 iphone）

/* 检查系统版本 */
//版本号相同
func systemVersionEqual(version:String) ->Bool {
    return UIDevice.current.systemVersion == version
}

//系统版本高于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错    具体原因待探究
func systemVersionGreaterThan(version:String) ->Bool{
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedAscending
}
//系统版本低于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错    具体原因待探究
func systemVersionLessThan(version:String) ->Bool{
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedDescending
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  catch缓存文件夹和Documents文件夹
//
///////////////////////////////////////////////////////////////////////////////////////////////////

let XHUserDefault = UserDefaults.standard
/// Cache缓存文件夹
let cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last
/// Documents文件夹
let documentsDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  图片  UIImage 加载本地  以及初始化
//
///////////////////////////////////////////////////////////////////////////////////////////////////

//读取本地图片 （文件名，后缀名）
func loadImage(imageName __imgName__:String,imgExtension __imgExt__:String) -> UIImage {
    return UIImage.init(contentsOfFile: Bundle.main.path(forResource: __imgName__, ofType: __imgExt__)!)!
}

//定义UIImage对象 （文件名）  png格式
func loadPNGImage(imageName __imgName__:String) -> UIImage {
    return UIImage.init(contentsOfFile: Bundle.main.path(forResource: __imgName__, ofType: "png")!)!
}


