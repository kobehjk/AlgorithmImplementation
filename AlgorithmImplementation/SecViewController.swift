//
//  SecViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/14.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit
import SnapKit

class SecViewController: UIViewController ,UIViewControllerTransitioningDelegate{

    lazy var detailController:DetailViewController = DetailViewController()
    
    lazy var edgeDragTransitionDelegate: InteractivityTransitionDelegate = InteractivityTransitionDelegate()
    
    lazy var edgeRecognizer : UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(edgeAction(gestureRecognizer:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        setupView()
        
        
        
    }

    func setupView() {
        let button1 = UIButton(type:.custom)
        button1.setTitle("全屏渐变", for: UIControlState())
        button1.addTarget(self, action: #selector(animationButtonDidClicked1), for: .touchUpInside)
        view.addSubview(button1)
        button1.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.bottom.equalTo(view).offset(-100)
        }
        let button2 = UIButton(type:.custom)
        button2.setTitle("推拉", for: UIControlState())
        button2.addTarget(self, action: #selector(animationButtonDidClicked2), for: .touchUpInside)
        view.addSubview(button2)
        button2.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.bottom.equalTo(button1).offset(-100)
        }
    }
    

//MARK: - 点击配置不同转场
    
    func animationButtonDidClicked1() {
//        detailController.transitioningDelegate = nil
        detailController.modalPresentationStyle = .fullScreen
        detailController.transitioningDelegate = self
        self.present(detailController, animated: true, completion: nil)
    }
    
    func animationButtonDidClicked2() {
//        detailController.transitioningDelegate = nil
        detailController.modalPresentationStyle = .fullScreen
        detailController.transitioningDelegate = edgeDragTransitionDelegate
        edgeRecognizer.edges = .right
        self.view.addGestureRecognizer(edgeRecognizer)
//        self.present(detailController, animated: true, completion: nil)

        
    }

//MARK: - 点击事件
    
    func edgeAction(gestureRecognizer:AnyObject) {
        if gestureRecognizer.state == .began {
            self.animationBegan(gesture: gestureRecognizer)
        }
    }
    
    func animationBegan(gesture:AnyObject) {
        if gesture.isKind(of: UIGestureRecognizer.self){
            edgeDragTransitionDelegate.gestureRecognizer = edgeRecognizer
        }else{
            edgeDragTransitionDelegate.gestureRecognizer = nil
        }
        
        edgeDragTransitionDelegate.targetEdge = .right
        self.present(detailController, animated: true, completion: nil)
    }
}

extension SecViewController{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return HalfSpringAnimator()
    }
    
}
