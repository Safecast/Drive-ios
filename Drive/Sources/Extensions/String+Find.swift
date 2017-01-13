//
//  String+Find.swift
//  Drive
//
//  Created by Marc Rollin on 2017/01/13.
//  Copyright © 2017 Safecast. All rights reserved.
//

import Foundation

extension String {
    
    // Extract information from an string following a regexp pattern
    func find(withPattern pattern: String) -> String? {
        guard let regexp = try? NSRegularExpression(pattern: pattern),
            let result = regexp.firstMatch(in: self, options: [], range: NSMakeRange(0, characters.count)) else {
            return nil
        }
        
        return (self as NSString).substring(with: result.rangeAt(1))
    }
}
