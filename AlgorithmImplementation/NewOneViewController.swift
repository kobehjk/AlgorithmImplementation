//
//  NewOneViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/18.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit


class NewOneViewController: UIViewController {
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView() // 主要是一些UI控件的布局，可以无视其实现细节
        
        self.updatePreferredContentSizeWithTraitCollection(self.traitCollection)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Layout
extension NewOneViewController {
    func updatePreferredContentSizeWithTraitCollection(_ traitCollection: UITraitCollection) {
        self.preferredContentSize = CGSize(width: self.view.bounds.size.width, height: traitCollection.verticalSizeClass == .compact ? 270 : 420)
        
        slider.maximumValue = Float(self.preferredContentSize.height)
        slider.minimumValue = 220
        slider.value = self.slider.maximumValue
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        self.updatePreferredContentSizeWithTraitCollection(newCollection)
    }
}

// MARK: - UI事件处理
extension NewOneViewController {
    func buttonDidClicked() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func sliderValueChange(_ sender: UISlider) {
        self.preferredContentSize = CGSize(width: self.view.bounds.size.width, height: CGFloat(sender.value))
    }
}

// MARK: - 对视图上的基本UI控件进行初始化，读者可以忽略
extension NewOneViewController {
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)    // 设置背景颜色
        
        /// 创建label
        let label = UILabel()
        label.text = "To"
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 60)
        view.addSubview(label)
        label.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(view)
            make.height.equalTo(144)
        }
        
        view.addSubview(slider)
        slider.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(30)
        }
        slider.addTarget(self, action: #selector(NewOneViewController.sliderValueChange(_:)), for: .valueChanged)
        
        /// 创建button
        let button = UIButton()
        button.setTitleColor(UIColor.blue, for: UIControlState())
        button.setTitle("Dismiss", for: UIControlState())
        button.addTarget(self, action: #selector(NewOneViewController.buttonDidClicked), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(view).offset(-20)
            make.top.equalTo(slider.snp.bottom).offset(8)
            make.centerX.equalTo(view)
            make.width.equalTo(245)
        }
    }
}

