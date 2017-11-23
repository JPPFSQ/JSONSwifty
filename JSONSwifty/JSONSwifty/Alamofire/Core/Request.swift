//
//  Request.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/10/30.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation
// A type that can inspect and optionally adapt a 'URLRequest' in some manner if necessary.
public protocol RequestAdapter {
    // Inspects and adapts the specified 'URLRequest' in some manner if necessary and returns the result.
    // - parameter urlRequest: The URL request to adapt.
    // - throws: An 'Error' if the adaptation encounters an error.
    // - returns: The adapted 'URLRequest'.
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest
}
