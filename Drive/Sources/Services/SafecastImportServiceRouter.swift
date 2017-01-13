//
//  SafecastImportServiceRouter.swift
//  Drive
//
//  Created by Marc Rollin on 2017/01/13.
//  Copyright © 2017 Safecast. All rights reserved.
//

import Foundation
import struct Alamofire.Parameters
import enum Alamofire.HTTPMethod

enum SafecastImportServiceRouter: ServiceRouter {
    
    // Endpoints
    case list(String, userId: Int, page: Int)
    case create(String, boundary: String)
    case read(String, id: Int)
    case update(String, id: Int, key: String, name: String, description: String, cities: String, credits: String)
    case submit(String, id: Int, key: String)
    
    var baseURLString: String {
        switch self {
        case let .list(baseURLString, _, _),
             let .create(baseURLString, _),
             let .read(baseURLString, _),
             let .update(baseURLString, _, _, _, _, _, _),
             let .submit(baseURLString, _, _):
            return baseURLString
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .create:
             return .post
        case .update, .submit:
            return .put
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return "/bgeigie_imports.json"
        case .create:
            return "/bgeigie_imports.json"
        case let .read(_, id):
            return "/bgeigie_imports/\(id).json"
        case let .update(_, id, _, _, _, _, _):
            return "/bgeigie_imports/\(id)"
        case let .submit(_, id, _):
            return "/bgeigie_imports/\(id)/submit"
        }
    }
    
    var parameters: Parameters {
        switch self {
        case let .list(_, userId, page):
            return ["by_user_id": userId, "page": page, "order": "created_at desc"]
        case let .update(_, _, key, cities, credits, name, description):
            return ["api_key": key, "bgeigie_import[credits]": credits, "bgeigie_import[cities]": cities, "bgeigie_import[name]": name, "bgeigie_import[description]": description]
        case let .submit(_, _, key):
            return ["api_key": key]
       default:
            return [:]
        }
    }
    
    var multipartBoundary: String? {
        guard case let .create(_, boundary) = self else {
            return nil
        }
        
        return boundary
    }
}
