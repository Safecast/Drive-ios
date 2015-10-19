//
//  UIViewController.swift
//  Drivecast
//
//  Created by Marc Rollin on 10/18/15.
//  Copyright © 2015 Safecast. All rights reserved.
//

import Foundation
import ReactiveCocoa

extension UIViewController {
    public var rac_title: MutableProperty<String> {
        return lazyMutableProperty(self, key: &AssociationKey.title, setter: { self.title = $0 }, getter: { self.title ?? "" })
    }
}