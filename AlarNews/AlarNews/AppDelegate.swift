//
//  AppDelegate.swift
//  AlarNews
//
//  Created by Kim on 2017/10/25.
//  Copyright © 2017年 Brain. All rights reserved.
//

import UIKit
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        showLaunchImage()
        UIApplication.shared.statusBarStyle = .lightContent
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

// MARK: - 启动图片
extension AppDelegate {
    
    func showLaunchImage() {
        
        
        var imageName = ""
        guard let imagesDic = Bundle.main.infoDictionary,
            let images = imagesDic["UILaunchImages"] else { return }
        
        for dic in images as! NSArray {
            let dic = dic as! NSDictionary
            guard let string = dic["UILaunchImageSize"] else {continue}
            
            let imageSize = CGSizeFromString(string as! String)
            if __CGSizeEqualToSize(imageSize, window?.bounds.size ?? CGSize()) {
                imageName = dic["UILaunchImageName"] as! String
            }
        }
        let image = UIImage(named: imageName)
        
        let imageView = UIImageView(frame: window?.bounds ?? CGRect())
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        imageView.tag = 101
        window?.rootViewController?.view.addSubview(imageView)
        print("")
        
        //添加个进入首页按钮
        let button = UIButton(type: .custom)
        
        button.setTitle("进入首页", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(showHomePage), for: .touchUpInside)
        imageView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(imageView)
        }
    }
    
    @objc func showHomePage() {
        let imageView = window?.rootViewController?.view.viewWithTag(101)
        imageView?.removeFromSuperview()
    }
}

