//
//  NSDecimalNumberTransform.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/22.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

open class NSDecimalNumberTransform: TransformType {
    public typealias Object = NSDecimalNumber
    public typealias JSON = String
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> NSDecimalNumber? {
        if let string = value as? String {
            return NSDecimalNumber(string: string)
        }
        
        if let double = value as? Double {
            return NSDecimalNumber(value: double)
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: NSDecimalNumber?) -> String? {
        guard let value = value else {
            return nil
        }
        
        return value.description
    }
}
