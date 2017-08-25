//
//  InteractivityTransitionDelegate.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/17.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class InteractivityTransitionDelegate: NSObject,UIViewControllerTransitioningDelegate {

    var gestureRecognizer:UIScreenEdgePanGestureRecognizer?
    var targetEdge :UIRectEdge = UIRectEdge()
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return InteractivityTransitionAnimator.init(target: targetEdge)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return InteractivityTransitionAnimator.init(target: targetEdge)
    }

    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let gesture = self.gestureRecognizer {
            return TransitionInteractionViewController(gestureRecognizer: gesture, edgeForDragging: self.targetEdge)
        }
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let gesture = self.gestureRecognizer {
            return TransitionInteractionViewController(gestureRecognizer: gesture, edgeForDragging: self.targetEdge)
        }
        return nil
    }
    
}
