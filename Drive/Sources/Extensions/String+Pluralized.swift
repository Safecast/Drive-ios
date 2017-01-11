//
//  String+Pluralized.swift
//  ZenlyInfiniteNavigation
//
//  Created by Marc Rollin on 2017/01/06.
//
//

import UIKit

extension String {
    
    /// Returns the plural of a String.
    ///
    /// - returns: A copy of the string after being made plural.
    func pluralized() -> String {
        
        // TODO: Very simplistic (and agramatical) approach, need to implement real plural rules.
        return self.appending("s")
    }
}
