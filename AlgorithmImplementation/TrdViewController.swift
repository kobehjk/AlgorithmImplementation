//
//  TrdViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/14.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class TrdViewController: UIViewController {

    lazy var newoneControl: NewOneViewController = NewOneViewController()
    lazy var customPresentationController: CustomPresentationController = CustomPresentationController(presentedViewController: self.newoneControl, presenting: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setView()
        newoneControl.transitioningDelegate = customPresentationController
    }

    func setView() {
        /// 创建button
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: UIControlState())
        button.setTitle("演示动画", for: UIControlState())
        button.addTarget(self, action: #selector(TrdViewController.animationButtonDidClicked), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.width.equalTo(250)
            make.height.equalTo(60)
            make.bottom.equalTo(view).offset(-40)
        }
    }

    
    func animationButtonDidClicked() {
        self.present(newoneControl, animated: true, completion: nil)
    }
}
