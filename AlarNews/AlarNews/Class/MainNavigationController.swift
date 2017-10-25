//
//  MainNavigationController.swift
//  AlarNews
//
//  Created by Kim on 2017/10/25.
//  Copyright © 2017年 Brain. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        if self.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
        }
        
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        button.setImage(#imageLiteral(resourceName: "navi_back_icon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0)
        button.addTarget(self, action: #selector(goback), for: .touchUpInside)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        super.pushViewController(viewController, animated: animated)
    }

    @objc func goback() {
        popViewController(animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        if navigationController.responds(to: #selector(getter: interactivePopGestureRecognizer)) {
            navigationController.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
}
