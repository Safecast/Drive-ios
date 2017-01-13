//
//  ServiceRouter.swift
//  Drive
//
//  Created by Marc Rollin on 2017/01/13.
//  Copyright © 2017 Safecast. All rights reserved.
//

import Foundation
import protocol Alamofire.URLConvertible
import protocol Alamofire.URLRequestConvertible
import struct Alamofire.Parameters
import struct Alamofire.URLEncoding
import enum Alamofire.HTTPMethod

protocol ServiceRouter: URLConvertible, URLRequestConvertible {
    var baseURLString: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters { get }
    var multipartBoundary: String? { get }
}

extension ServiceRouter {

    var multipartBoundary: String? {
        return nil
    }
}

// MARK: URLConvertible
extension URLConvertible where Self: ServiceRouter {
    
    /// Returns the URL of the route.
    ///
    /// throws: An error if the route cannot be generated.
    ///
    /// returns: The URL.
    func asURL() throws -> URL {
        let url = try baseURLString.asURL()
        
        return url.appendingPathComponent(path)
    }
}

// MARK: URLRequestConvertible
extension URLRequestConvertible where Self: ServiceRouter, Self: URLConvertible {
    
    /// Returns a request for the route.
    ///
    /// throws: An error if the request cannot be generated.
    ///
    /// returns: The request.
    func asURLRequest() throws -> URLRequest {
        var request         = URLRequest(url: try asURL())
        let encoding        = URLEncoding.default
        
        request.httpMethod  = method.rawValue
        
        if let boundary = multipartBoundary {
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        }

        return try encoding.encode(request, with: parameters)
    }
}
