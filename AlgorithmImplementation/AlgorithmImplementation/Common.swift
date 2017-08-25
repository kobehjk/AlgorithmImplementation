//
//  Common.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/14.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

let UMAPP_KEY = "5739866a67e58edf4700193c"
let WECHAT_KEY = "wx40bde9620d17df85"
let WECHAT_SECRET = "65c4a3c1e21cbeb2010a48503efb8e20"
let QQ_APPID = "1101188998"
let QQ_16 = "QQ41a2cf86"
//NetConfig
/// 服务器地址
let BASE_URL = "http://365.glodon.com"
let TEST_URL = "http://192.168.8.92:8088"
/// 文件下载地址
let DOWNLOAD_URL = "http://norm.glodon.com/download/"

///沙盒购买验证地址
let ITMS_SANDBOX_VERIFY_RECEIPT_URL = "https://sandbox.itunes.apple.com/verifyReceipt"

///正式购买验证地址
let ITMS_ITUNS_VERIFY_RECEIPT_URL = "https://buy.itunes.apple.com/verifyReceipt"

//通知名称
let SHARENOTI = "datashare"
let WEBSHARENOTI = "webshare"
let ARTICLESHARE = "articelShare"

//数据存储名称
let SIGNSUCCESS = "signSuccess"
let SIGNDAYS = "signDay"
let SHARETIME = "shareTime"

//公用字符串

let NETFAILED = "网络连接失败"

//友盟统计事件

enum KJUMEVENTTYPE: String {
    case SEARCH = "0001"
    case BUYKKB = "0031"
    case BUYVIP = "0030"
    case HOME = "0008"
    case DATA = "0009"
    case NORM = "0029"
    case TOPIC = "0010"
    case MY = "0011"
}

/// iPhone 5
let isIPhone5 = SCREENH == 568 ? true : false
/// iPhone 6
let isIPhone6 = SCREENH == 667 ? true : false
/// iPhone 6P
let isIPhone6P = SCREENH == 736 ? true : false

/// 下载状态
enum KJFileStatus: Int {
    case loaded = 1
    case loading = 2
    case unload = 3
}

enum ProductID: String {
    case ONEHUNDREDKKB      = "4028da925528b60c015528b8dbf90013"
    case FIVEHUNDREDKKB     = "4028da925528b60c015528b8dbf90014"
    case ONETHOUSANDKKB     = "4028da925528b60c015528b8dbf90015"
    case TWOTHOUSANDKKB     = "4028da925528b60c015528b8dbf90016"
    case FOURTHOUSANDKKB    = "4028da925528b60c015528b8dbf90017"
    case DIAMONDVIP         = "4028da925528b60c015528b8dbf90020"
    case PLATINUMVIP        = "4028da925528b60c015528b8dbf90018"
}

///下载文件目录路径
func KJgetDocPath()->String{
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let documentDirectory = URL(fileURLWithPath: path)
    return documentDirectory.path
}

func KJgetDoc()->URL{
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let documentDirectory = URL(fileURLWithPath: path)
    return documentDirectory
}



//分享渠道
enum KJShareButtonType: Int {
    /// 微信朋友圈
    case weChatTimeline = 0
    /// 微信好友
    case weChatSession = 1
    /// 微博
    case weibo = 2
    /// QQ 空间
    case qZone = 3
    /// QQ 好友
    case qqFriends = 4
    /// 复制链接
    case copyLink = 5
}

enum KJOtherLoginButtonType: Int {
    /// 微博
    case weiboLogin = 100
    /// 微信
    case weChatLogin = 101
    /// QQ
    case qqLogin = 102
}

/// iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
/// 可以在自己的手机上安装一个今日头条，然后通过 charles 抓取一下这个 iid，
/// 替换成自己的，再进行测试
let IID: String = "5034850950"
let device_id: String = "6096495334"
let version_code = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String


/// tabBar 被点击的通知
let YMTabBarDidSelectedNotification = "YMTabBarDidSelectedNotification"

/// 第一次启动键值
let KJFirstLaunchKey = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
/// 第一次启动
var KJNOTFirstLaunch :Bool = false

/// 第一次启动搜索页
var KJFirstSearch = true

/// 新标记
let NEWFLAG1 = "newFlag1" + version_code
let NEWFLAG2 = "newFlag2" + version_code
let NEWFLAG3 = "newFlag3" + version_code

/// 是否登录
let isLogin = "isLogin"

/// 是否弹评价窗
var isShowComment :Bool = true
let ShowCommentKey = "showcomment"

/// 是否弹开通通知权限窗
var isShowNotiAlter :Bool = true
let ShowNotiAlterKey = "shownotialter"

let loginNoti = "userCheck"

/// code 码 200 操作成功
let RETURN_OK = 200
/// 间距

let kLIndicatorSize :CGFloat = SCREENW > 400 ? 40 : 30
let kMargin: CGFloat = 10.0
/// 首页新闻间距
let kHomeMargin: CGFloat = 15.0
/// 圆角
let kCornerRadius: CGFloat = 5.0
/// 线宽
let klineWidth: CGFloat = 1.0
/// 首页顶部标签指示条的高度
let kIndicatorViewH: CGFloat = 2.0
/// 新特性界面图片数量
let kNewFeatureCount = 4
/// 顶部标题的高度
let kTitlesViewH: CGFloat = 35
/// 顶部标题的y
let kTitlesViewY: CGFloat = 64
/// 动画时长
let kAnimationDuration = 0.25

/// 获取屏幕
let ROOTCONTROL  = UIApplication.shared.delegate?.window??.rootViewController

/// 获取屏幕
let SCREEN  = UIApplication.shared.delegate?.window??.rootViewController?.view!
///statebar
let STATUSH = UIApplication.shared.statusBarFrame.size.height
/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height
/// 我的界面头部图像的高度
let kYMMineHeaderImageHeight: CGFloat = 210
//  个人界面 cell 高度
func KJMineCellH() -> CGFloat {
    if SCREENW > 400{
        return 50
    }else{
        return 45
    }
}



func KJColorHX(rgbValue: UInt,malpha:CGFloat) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(malpha)
    )
}

func KJThemeColor()->UIColor{
    return KJColorHX(rgbValue: 0x267FBA, malpha: 1)
}

func KJLightThemeColor()->UIColor{
    return KJColorHX(rgbValue: 0x267FBA, malpha: 0.5)
}

func KJDarkThemeColor()->UIColor{
    return KJThemeColor()
}

/// RGBA的颜色设置
func KJColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 背景灰色
func KJGlobalColor() -> UIColor {
    return KJColorHX(rgbValue: 0xefeff4, malpha: 1)
}

/// 登陆背景灰色
func KJLoginColor() -> UIColor {
    return KJColorHX(rgbValue: 0xfafafa, malpha: 1)
}

func KJDarkGlodenColor() ->UIColor{
    return KJColorHX(rgbValue: 0xE09010, malpha: 1)
}

///黑色字体
func KJBlackColor()->UIColor{
    return KJColorHX(rgbValue: 0x2c2c2c, malpha: 1)
}

///浅黑字体
func KJLightBlackColor()->UIColor{
    return KJColorHX(rgbValue: 0x515151, malpha: 1)
}

///灰色字体
func KJLightGrayColor() -> UIColor{
    return KJColorHX(rgbValue: 0x707070, malpha: 1)
}

/// 红色
func KJGlobalRedColor() -> UIColor {
    return KJColor(245, g: 80, b: 83, a: 1.0)
}

//字体
///超大字体
func KJSuperBigFont()->UIFont{
    return UIFont.init(name: "Helvetica", size: 20)!
}

///小屏超大字体
func KJLSuperBigFont()->UIFont{
    return UIFont.init(name: "Helvetica", size: 17)!
}

///大字体
func KJBigFont()->UIFont{
    return UIFont.init(name: "Helvetica", size: SCREENW > 400 ? 18 : 16)!
}

func KJLBigFont()->UIFont{
    return UIFont.init(name: "Helvetica", size: SCREENW > 400 ? 16 : 14)!
}

///用户信息文本大小
func KJUserFont()->UIFont{
    return UIFont.init(name: "Helvetica", size: 15)!
}

///小字体
func KJSmallFont()->UIFont{
    return UIFont.init(name: "Helvetica", size: 13)!
}
///中字体
func KJNormalFont()->UIFont{
    return UIFont.init(name: "Helvetica", size: 14)!
}

///自定义字体
func KJCustomFont(size:CGFloat)->UIFont{
    return UIFont.init(name: "Helvetica", size: size)!
}


