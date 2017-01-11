//
//  UIRectEdge+Index.swift
//  ZenlyInfiniteNavigation
//
//  Created by Marc Rollin on 2017/01/06.
//
//

import UIKit

extension UIRectEdge {
    
    /// Returns an array containing the 4 edges of a rectangle.
    var fourEdges: [UIRectEdge] {
        return [UIRectEdge.top, UIRectEdge.bottom, UIRectEdge.left, UIRectEdge.right]
    }

    /// Returns the index of an edged based on the rectangle's 4 edges.
    var index: Int {
        return fourEdges.index(of: self) ?? -1
    }
}
