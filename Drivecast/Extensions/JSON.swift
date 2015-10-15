//
//  JSON.swift
//  Drivecast
//
//  Created by Marc Rollin on 10/15/15.
//  Copyright © 2015 Safecast. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON: JSONCollectionDecodable {
    static func collection<T: JSONDecodable>(json: Array<JSON>) throws -> [T] {
        var collection = [T]()
        
        for element in json {
            collection.append(try T(json: element)!)
        }
        
        return collection
    }
}
