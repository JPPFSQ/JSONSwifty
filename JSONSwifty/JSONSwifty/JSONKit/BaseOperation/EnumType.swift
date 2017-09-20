//
//  EnumType.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/15.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

public protocol _RawEnumProtocol: _Transformable {
    static func _transform(from object: Any) -> Self?
    func _plainValue() -> Any?
}

extension RawRepresentable where Self: _RawEnumProtocol {
    public static func _transform(from object: Any) -> Self? {
        if let transformableType = RawValue.self as? _Transformable.Type {
            if let typedValue = transformableType.transform(from: object) {
                return Self(rawValue: typedValue as! RawValue)
            }
        }
        
        return nil
    }
    
    public func _plainValue() -> Any? {
        return self.rawValue
    }
}
