//
//  AppDelegate.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/7.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.brown
        
        let slideControl = SlideViewController()
        
        let tabcontrol = UITabBarController()
        
        tabcontrol.tabBar.frame = CGRect.init(x: 0, y: SCREENH-49, width: SCREENW, height: 49)
        let homeControl = ViewController()
        homeControl.title = "首页"
        let homeNav = UINavigationController.init(rootViewController: homeControl)
        let secControl = SecViewController()
        secControl.title = "动画"
        let secNav = UINavigationController.init(rootViewController: secControl)
        let trdControl = TrdViewController()
        trdControl.title = "我的"
        let trdNav = UINavigationController.init(rootViewController: trdControl)
        
        tabcontrol.viewControllers = [homeNav,secNav,trdNav]
        tabcontrol.selectedIndex = 0
        
        
        
        window?.rootViewController = MainViewController.init(mainVC: tabcontrol, slideVC: slideControl, leftWidth: 250)
        window?.makeKeyAndVisible()
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

