//
//  Transformable.swift
//  JsonSwifty
//
//  Created by Shaoqing Fan on 2017/9/12.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

public protocol _Transformable: _Measurable {}

extension _Transformable {
    static func transform(from object: Any) -> Self? {
        if let typedObject = object as? Self {
            return typedObject
        }
        
        switch self {
        case let type as _ExtendCustomBasicType.Type:
            return type._transform(from: object) as? Self
            
        case let type as _BuiltInBridgeType.Type:
            return type._transform(from: object) as? Self
            
        case let type as _RawEnumProtocol.Type:
            return type._transform(from: object) as? Self
            
        case let type as _ExtendCustomModelType.Type:
            return type._transform(from: object) as? Self
        
        default:
            return nil
        }
    }
    
    func plainValue() -> Any? {
        switch self {
        case let rawValue as _ExtendCustomBasicType:
            return rawValue._plainValue()
            
        case let rawValue as _BuiltInBridgeType:
            return rawValue._plainValue()
            
        case let rawValue as _BuiltInBasicType:
            return rawValue._plainValue()
            
        case let rawValue as _RawEnumProtocol:
            return rawValue._plainValue()
            
        case let rawValue as _ExtendCustomModelType:
            return rawValue._plainValue()
            
        default:
            return nil
        }
    }
}
