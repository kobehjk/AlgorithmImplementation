//
//  MainViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/14.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var tabControl : UIViewController?
    var slideControl : UIViewController?
    var maxWidth :CGFloat = 300
    
    static let shareDrawer = UIApplication.shared.keyWindow?.rootViewController as? MainViewController
    
    init(mainVC:UIViewController,slideVC:UIViewController,leftWidth:CGFloat) {
        super.init(nibName: nil, bundle: nil)
        
        self.tabControl = mainVC
        self.slideControl = slideVC
        self.maxWidth = leftWidth
        
        view.addSubview(mainVC.view)
        view.addSubview(slideVC.view)
        
        view.bringSubview(toFront: mainVC.view)
        
        
        addChildViewController(mainVC)
        addChildViewController(slideVC)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        slideControl?.view.transform = CGAffineTransform.init(translationX: -maxWidth, y: 0)
        
        for childController in (tabControl?.childViewControllers)! {
            addScreenEdgrPanGestureRecognizerToView(view: childController.view)
        }
        
    }

    func slideViewController(didSelector control:UIViewController) {
        let tabbarVC = self.tabControl as? UITabBarController
        let nav = tabbarVC?.selectedViewController as! UINavigationController
        nav.pushViewController(control, animated: false)
        closeMenu()
    }
    
    func addScreenEdgrPanGestureRecognizerToView(view:UIView) {
        let pan = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(edgePanGeture(_:)))
        pan.edges = UIRectEdge.left
        view.addGestureRecognizer(pan)
        
    }
    
    func edgePanGeture(_ pan:UIScreenEdgePanGestureRecognizer) {
        let offsetX = pan.translation(in: pan.view).x
        
        if pan.state == UIGestureRecognizerState.changed && offsetX <= maxWidth {
            tabControl?.view.transform = CGAffineTransform.init(translationX: max(offsetX, 0), y: 0)
            slideControl?.view.transform = CGAffineTransform.init(translationX: -maxWidth+offsetX, y: 0)
        }else if pan.state == UIGestureRecognizerState.ended || pan.state == UIGestureRecognizerState.cancelled || pan.state == UIGestureRecognizerState.failed{
            if offsetX > SCREENW * 0.4 {
                openMenu()
            }else{
                closeMenu()
            }
        }
        
    }
    
    func openMenu() {
        UIView.animate(withDuration: 0.25,delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            
            self.slideControl?.view.transform = CGAffineTransform.identity
            self.tabControl?.view.transform = CGAffineTransform.init(translationX: self.maxWidth, y: 0)
            
        }) { (finish) in
            self.tabControl?.view.addSubview(self.coverBtn)
        }
    }
    
    func closeMenu() {
        UIView.animate(withDuration: 0.25, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.slideControl?.view.transform = CGAffineTransform.init(translationX: -self.maxWidth, y: 0)
            self.tabControl?.view.transform = CGAffineTransform.identity
            
        }) { (finish) in
            self.coverBtn.removeFromSuperview()
        }
    }
    
    func panClooseMenu(_ pan:UIPanGestureRecognizer) {
        let offsetX = pan.translation(in: pan.view).x
        
        if offsetX > 0 {
            return
        }
        
        if pan.state == UIGestureRecognizerState.changed && offsetX <= maxWidth {
            let distance = maxWidth + offsetX
            
            tabControl?.view.transform = CGAffineTransform.init(translationX: max(distance, 0), y: 0)
            slideControl?.view.transform = CGAffineTransform.init(translationX: offsetX, y: 0)
        }else if pan.state == UIGestureRecognizerState.ended || pan.state == UIGestureRecognizerState.cancelled || pan.state == UIGestureRecognizerState.failed{
            if offsetX > SCREENW * 0.4 {
                openMenu()
            }else{
                closeMenu()
            }
        }
    }
    
    private lazy var coverBtn: UIButton = {
        let btn = UIButton.init(frame: (self.tabControl?.view.bounds)!)
        btn.backgroundColor = UIColor.clear
        
        btn.addTarget(self,action:#selector(closeMenu),for:.touchUpInside)
        
        btn.addGestureRecognizer(UIPanGestureRecognizer.init(target: self, action: #selector(panClooseMenu(_:))))
        
        return btn
    }()
    
    
}
