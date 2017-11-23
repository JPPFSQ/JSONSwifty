//
//  BuiltInBridgeType.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/15.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

protocol _BuiltInBridgeType: _Transformable {
    static func _transform(from object: Any) -> _BuiltInBridgeType?
    func _plainValue() -> Any?
}

extension NSString: _BuiltInBridgeType {
    static func _transform(from object: Any) -> _BuiltInBridgeType? {
        if let str = String.transform(from: object) {
            return NSString(string: str)
        }
        
        return nil
    }
    
    func _plainValue() -> Any? {
        return self
    }
}

extension NSNumber: _BuiltInBridgeType {
    static func _transform(from object: Any) -> _BuiltInBridgeType? {
        switch object {
        case let num as NSNumber:
            return num
            
        case let str as NSString:
            let lowercase = str.lowercased
            if lowercase == "true" {
                return NSNumber(booleanLiteral: true)
            } else if lowercase == "false" {
                return NSNumber(booleanLiteral: false)
            } else {
                // normal number
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                return formatter.number(from: str as String)
            }
            
        default:
            return nil
        }
    }
    
    func _plainValue() -> Any? {
        return self
    }
}

extension NSArray: _BuiltInBridgeType {
    static func _transform(from object: Any) -> _BuiltInBridgeType? {
        return object as? NSArray
    }
    
    func _plainValue() -> Any? {
        return (self as? Array<Any>)?.plainValue()
    }
}

extension NSDictionary: _BuiltInBridgeType {
    static func _transform(from object: Any) -> _BuiltInBridgeType? {
        return object as? NSDictionary
    }
    
    func _plainValue() -> Any? {
        return (self as? Dictionary<String, Any>)?.plainValue()
    }
}
