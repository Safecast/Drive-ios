//
//  SDCMeasurementColorLUT.swift
//  safecaster
//
//  Created by Marc Rollin on 10/14/15.
//  Copyright © 2015 Safecast. All rights reserved.
//

import UIKit

struct SDCMeasurementColorLUT {
    let min: Double = 0.03 * 350.0
    let max: Double = 65.535 * 350.0
    lazy var rdiff: Double = { return 1.0 / (self.max - self.min) }()
    lazy var n: Int = { return self.r.count }()
    lazy var nsb1: Double = { return Double(self.n) - 1.0 }()

    let r: [UInt8] = [1,8,9,10,12,14,16,16,18,18,19,20,21,22,22,24,24,25,25,25,26,26,26,26,25,26,27,26,25,26,26,24,24,25,24,21,21,21,17,16,9,7,0,7,15,23,28,32,34,38,40,43,45,46,50,51,54,55,56,56,56,58,59,59,59,59,59,59,59,59,57,56,56,56,54,51,48,45,43,39,37,33,29,23,10,0,29,39,60,67,84,90,97,105,110,120,124,133,137,143,148,153,161,163,171,173,178,181,185,191,194,200,202,208,210,214,217,220,225,226,233,235,240,242,245,249,251,254,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
    let g: [UInt8] = [1,7,7,8,10,11,12,12,13,13,13,13,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,15,15,14,14,14,14,13,13,12,11,11,10,9,5,4,0,9,19,30,36,43,46,56,59,65,70,74,82,85,94,96,103,107,112,118,121,130,132,140,144,150,156,160,167,170,181,184,191,195,200,208,213,221,224,233,237,243,250,255,252,251,242,240,235,231,226,
        221,219,212,210,204,202,197,192,187,182,180,172,170,163,160,156,151,148,137,134,128,124,117,112,107,100,97,87,83,71,64,56,44,38,5,0,0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,25,36,42,53,57,68,73,81,85,89,96,98,106,109,119,123,128,133,136,144,146,153,156,162,
        166,170,180,183,191,193,200,204,208,214,217,224,226,234,239,247,251,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
        255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255]
    let b: [UInt8] = [1,10,12,15,19,23,29,31,38,39,43,48,54,59,61,70,72,79,83,89,94,99,109,112,122,125,135,140,145,153,158,169,173,186,191,199,206,212,223,228,239,244,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,254,247,242,234,227,221,211,207,196,192,183,179,174,166,161,154,151,140,136,128,123,119,113,111,102,100,94,88,81,75,72,65,63,55,52,47,42,38,32,29,18,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,10,20,23,31,36,41,47,51,62,65,74,78,84,90,94,102,105,115,118,128,133,138,145,148,157,159,168,172,179,186,191,198,202,211,215,222,226,232,238,242,253]
    
    func colorForIndex(index:Int) -> UIColor {
        return UIColor(red: CGFloat(self.r[index]) / 255,
            green: CGFloat(self.g[index]) / 255,
            blue: CGFloat(self.b[index]) / 255,
            alpha: 1.0)
    }
    
    mutating func indexForValue(cpm:Int) -> Int {
        var value = (Double(cpm) - min) * rdiff
        
        if value > 1 {
            value = 1
        } else if value < 0 {
            value = 0
        }
        
        for _ in 0...3 {
            value = log(value * 9.0 + 1.0) * 0.43429448190325176
        }
    
        return Int(value * nsb1)
    }
    
    mutating func colorForValue(cpm: Int) -> UIColor {
        return colorForIndex(indexForValue(cpm))
    }
}
