//
//  UIView+Extersion.swift
//  AlgorithmImplementation
//
//  Created by hjk on 2017/8/17.
//  Copyright © 2017年 kobehjk. All rights reserved.
//

import Foundation
import UIKit

extension UIView{

    func clipRectCorner(_ direction:UIRectCorner,cornerRadius:CGFloat) {
        let cornerSize = CGSize.init(width: cornerRadius, height: cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    var x:CGFloat {
    
        get{
            return frame.origin.x
        }
        set(newValue){
            var tempFrame :CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
            
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    var height :CGFloat {
        get{
            return frame.size.height
        }
        set(newValue){
            var tempFrame :CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
            
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }

    
}
