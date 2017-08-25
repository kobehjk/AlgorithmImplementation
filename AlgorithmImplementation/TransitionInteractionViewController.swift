//
//  TransitionInteractionViewController.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/18.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import UIKit

class TransitionInteractionViewController: UIPercentDrivenInteractiveTransition {

    var transitionContext : UIViewControllerContextTransitioning?
    var gestureRecognizer : UIScreenEdgePanGestureRecognizer
    var edge : UIRectEdge
    
    init(gestureRecognizer : UIScreenEdgePanGestureRecognizer,edgeForDragging edge: UIRectEdge) {
        assert(edge == .top || edge == .bottom || edge == .left || edge == .right,
               "edgeForDragging must be one of UIRectEdgeTop, UIRectEdgeBottom, UIRectEdgeLeft, or UIRectEdgeRight.")
        self.gestureRecognizer = gestureRecognizer
        self.edge = edge
        
        super.init()
        
        self.gestureRecognizer.addTarget(self, action: #selector(gestureRecognizerUpdate(_:)))
    }
    
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        super.startInteractiveTransition(transitionContext)
    }
    
    
    fileprivate func percentForGesture(_ gesture : UIScreenEdgePanGestureRecognizer)->CGFloat{
        let transitionContainView = transitionContext?.containerView
        let locationInSourceView = gesture.location(in: transitionContainView)
        
        let width = transitionContainView?.width
        let height = transitionContainView?.height
        
//        print(locationInSourceView.x)
        
        switch self.edge {
        case UIRectEdge.right:
            return(width! - locationInSourceView.x)/width!
           
        case UIRectEdge.left:
            return locationInSourceView.x/width!
            
        case UIRectEdge.bottom:
            return (height! - locationInSourceView.y) / height!
            
        case UIRectEdge.top:
            return locationInSourceView.y / height!
            
        default:
            return 0
        }
        
    }
    
    func gestureRecognizerUpdate(_ gestureRegnizer : UIScreenEdgePanGestureRecognizer) {
        switch gestureRegnizer.state {
        case .began:
            break
        case .changed:
            self.update(self.percentForGesture(gestureRegnizer))
        case .ended:
            if self.percentForGesture(gestureRegnizer) >= 0.5 {
                self.finish()
            }else{
                self.cancel()
            }
        default:
            self.cancel()
        }
    }
    
    
}
