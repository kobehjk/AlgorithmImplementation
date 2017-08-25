//
//  HalfSpringAnimator.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/17.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class HalfSpringAnimator: NSObject,UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        
        var fromView :UIView?
        var toView :UIView?
        
        
        if transitionContext.responds(to:  Selector(("viewForKey"))) {
            fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        }else{
            fromView = fromViewController?.view
            toView = toViewController?.view
        }
        
        toView?.frame = CGRect.init(x: (fromView?.x)!, y: (fromView?.height)!/2, width: (fromView?.width)!, height: (fromView?.height)!)
        toView?.alpha = 0.0
        
        containerView.addSubview(toView!)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveLinear, animations: {
            toView?.alpha = 1.0
            toView?.frame = transitionContext.finalFrame(for: toViewController!)
//            fromView?.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
        }) { (finish) in
            let cancelled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!cancelled)
        }
        
    }
    
}
