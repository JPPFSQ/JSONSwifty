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
        
        default:
            <#code#>
        }
    }
}
