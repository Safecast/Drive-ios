//
//  SafecastServiceRouter.swift
//  Drive
//
//  Created by Marc Rollin on 2017/01/13.
//  Copyright © 2017 Safecast. All rights reserved.
//

import Foundation
import struct Alamofire.Parameters
import enum Alamofire.HTTPMethod

enum SafecastServiceRouter: ServiceRouter {
    
    // Endpoints
    case dashboard(String)
    case user(String, id: Int)
    case signIn(String, email: String, password: String)
    case signOut(String)
    
    var baseURLString: String {
        switch self {
        case let .dashboard(baseURLString),
             let .user(baseURLString, _),
             let .signIn(baseURLString, _, _),
             let .signOut(baseURLString):
            return baseURLString
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .signIn:
            return .post
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case let .user(_, id):
            return "/users/\(id).json"
        case .signIn:
            return "/users/sign_in"
        case .signOut:
            return "/logout"
        default:
            return ""
        }
    }
    
    var parameters: Parameters {
        switch self {
        case let .signIn(_, email, password):
            return ["user[email]": email, "user[password]": password]
        default:
            return [:]
        }
    }
}
