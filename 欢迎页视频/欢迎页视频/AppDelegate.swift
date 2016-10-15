//
//  AppDelegate.swift
//  欢迎页视频
//
//  Created by 彭盛凇 on 16/10/15.
//  Copyright © 2016年 huangbaoche. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
        
        
        //判断是否为第一次登录,并显示对应的主控制器
        isFirst()
        
        return true
    }

    func isFirst() {
        
        
        let isFirst = UserDefaults.standard.object(forKey: "isFirstLogin") as? Bool ?? false
        
        if isFirst {//不是第一次登录
            
            let vc = ViewController()
            
            window?.rootViewController = vc
            
        }else {//是第一次登录
            
            let firstVC = FirstViewController()
            
            let path = Bundle.main.path(forResource: "qidong", ofType: "mp4")!
            
            let url = URL(fileURLWithPath: path)
            
            firstVC.videoUrl = url
            
//            firstVC.videoUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "qidong", ofType: "mp4")!)
            
            window?.rootViewController = firstVC
            
//            UserDefaults.standard.set(true, forKey: "isFirstLogin")
        }
    }
}

