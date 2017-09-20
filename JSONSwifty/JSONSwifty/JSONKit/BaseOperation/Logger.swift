//
//  InternalLogger.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/20.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

struct InternalLogger {
    static func logError (_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if HandyJSONConfiguration.debugMode.rawValue <= DebugMode.error.rawValue {
            print(items, separator: separator, terminator: terminator)
        }
    }
    
    static func logDebug(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if HandyJSONConfiguration.debugMode.rawValue <= DebugMode.error.rawValue {
            print(items, separator: separator, terminator: terminator)
        }
    }
    
    static func logVerbose(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        if HandyJSONConfiguration.debugMode.rawValue <= DebugMode.error.rawValue {
            print(items, separator: separator, terminator: terminator)
        }
    }
}
