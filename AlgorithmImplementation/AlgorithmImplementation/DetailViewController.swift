//
//  DetailViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/17.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var interactiveTransitionRecognizer: UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(DetailViewController.interactiveTransitionRecognizerAction(_:)))
    
    var interactiveTransition :KJInteractivityTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        let btn = UIButton(type: .custom)
        btn.setTitle("dismiss", for: .normal)
        btn.addTarget(self, action: #selector(dismissClick), for: .touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.center.equalTo(view.center)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        interactiveTransitionRecognizer.edges = .left
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
        
        interactiveTransition = KJInteractivityTransition.init(gestureType: .pan, controlAnimationType: .Scale, viewController: self)
        self.setKj_RightGesture(kj_rightGesture: false)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.delegate = interactiveTransition
    }
    
    func dismissClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func interactiveTransitionRecognizerAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .began {
            self.buttonDidClicked(sender)
        }
    }
    
    func buttonDidClicked(_ sender: AnyObject) {
        // 和FirstViewController中的代码是类似的，不过返回时手势应该是从左向右
        if let transitionDelegate = self.transitioningDelegate as? InteractivityTransitionDelegate {
            if sender.isKind(of: UIGestureRecognizer.self) {
                transitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
            }
            else {
                transitionDelegate.gestureRecognizer = nil
            }
            transitionDelegate.targetEdge = .left
        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
