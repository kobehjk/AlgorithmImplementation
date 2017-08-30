//
//  CustomNavigationController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/29.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    
}

extension CustomNavigationController{
    
}
