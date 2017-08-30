//
//  BaseViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/30.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var customBar: UINavigationBar = UINavigationBar.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64))
    
    lazy var customItem: UINavigationItem = UINavigationItem.init()
    
    override var title: String?{
        didSet{
            customItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
}

extension BaseViewController{
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(customBar)
        customBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        customBar.alpha = 1;
        customBar.items = [customItem]
    }
    
}
