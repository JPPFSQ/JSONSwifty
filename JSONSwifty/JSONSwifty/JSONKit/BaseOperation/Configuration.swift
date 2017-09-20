//
//  Configuration.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/20.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

public struct DeserializeOptions: OptionSet {
    public let rawValue: Int
    
    public static let caseInsensitive = DeserializeOptions(rawValue: 1 << 0)
    
    public static let defaultOptions: DeserializeOptions = []
    
    public init(rawValue: Int){
        self.rawValue = rawValue
    }
}

public enum DebugMode: Int {
    case verbose = 0
    case debug = 1
    case error = 2
    case none = 3
}

public struct HandyJSONConfiguration {
    private static var _mode = DebugMode.error
    public static var debugMode: DebugMode {
        get {
            return _mode
        }
        set {
            _mode = newValue
        }
    }
    
    public static var deserializeOptions:DeserializeOptions = .defaultOptions
}
