//
//  Array+Shuffled.swift
//  ZenlyInfiniteNavigation
//
//  Created by Marc Rollin on 2017/01/06.
//
//

import Foundation
import class GameplayKit.GKRandomSource

extension Array {
    
    /// Returns an array with the contents of this sequence, shuffled.
    ///
    /// - returns: A copy of the array after being shuffled.
    func shuffled() -> [Element] {
        return GKRandomSource.sharedRandom()
            .arrayByShufflingObjects(in: self) as? [Element] ?? self
    }
}
