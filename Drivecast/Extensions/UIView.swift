//
//  UIView.swift
//  Drivecast
//
//  Created by Marc Rollin on 10/16/15.
//  Copyright © 2015 Safecast. All rights reserved.
//

import UIKit
import ReactiveCocoa

extension UIView {
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var isRounded: Bool {
        get {
            let radius = min(CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds)) / 2.0
            
            return radius == cornerRadius
        } set {
            if newValue {
                let radius = min(CGRectGetHeight(self.bounds), CGRectGetWidth(self.bounds)) / 2.0
                
                cornerRadius = radius
            }
        }
    }    
}

extension UIView {
    public var rac_alpha: MutableProperty<CGFloat> {
        return lazyMutableProperty(self, key: &AssociationKey.alpha, setter: { self.alpha = $0 }, getter: { self.alpha })
    }
    
    public var rac_hidden: MutableProperty<Bool> {
        return lazyMutableProperty(self, key: &AssociationKey.hidden, setter: { self.hidden = $0 }, getter: { self.hidden })
    }
}