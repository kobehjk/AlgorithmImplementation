//
//  InteractivityTransitionAnimator.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/17.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class InteractivityTransitionAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    let targetEdge:UIRectEdge
    
    init(target:UIRectEdge) {
        self.targetEdge = target
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        
        var fromView = fromViewController?.view
        var toView = toViewController?.view
        
        if transitionContext.responds(to: #selector(UIViewControllerTransitionCoordinatorContext.view(forKey:))) {
            fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        }

        let isPresenting = (toViewController?.presentationController == fromViewController)
        
        let fromFrame = transitionContext.initialFrame(for: fromViewController!)
        
        let toframe = transitionContext.finalFrame(for: toViewController!)
        
        let offset: CGVector
        
        switch self.targetEdge {
        case UIRectEdge.top:
            offset = CGVector.init(dx: 0, dy: 1)
        case UIRectEdge.bottom:
            offset = CGVector.init(dx: 0, dy: -1)
        case UIRectEdge.left:
            offset = CGVector.init(dx: 1, dy: 0)
        case UIRectEdge.right:
            offset = CGVector.init(dx: -1, dy: 0)
        default:fatalError("targetEdge must be one of UIRectEdgeTop, UIRectEdgeBottom, UIRectEdgeLeft, or UIRectEdgeRight.")
        }
        
        if isPresenting {
            fromView?.frame = fromFrame
            toView?.frame = toframe.offsetBy(dx: toframe.width*offset.dx * -1, dy:toframe.height * offset.dy * -1 )
            
            containerView.addSubview(toView!)
        }else{
            fromView?.frame = fromFrame
            toView?.frame = toframe
            containerView.insertSubview(toView!, belowSubview: fromView!)
        }
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: { 
            if isPresenting{
                toView?.frame = toframe
                fromView?.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            }else{
                fromView?.frame = fromFrame.offsetBy(dx: fromFrame.size.width * offset.dx, dy:fromFrame.height * offset.dy )
                fromView?.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
//                fromView?.transform = CGAffineTransform.identity
            }
        }) { (finish) in
            let cancled = transitionContext.transitionWasCancelled
            if cancled{
                toView?.removeFromSuperview()
            }
            transitionContext.completeTransition(!cancled)
        }
        
        
    }
    
}
