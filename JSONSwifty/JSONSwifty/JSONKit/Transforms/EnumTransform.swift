//
//  EnumTransform.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/22.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

open class EnumTransform<T: RawRepresentable>: TransformType {
    public typealias Object = T
    public typealias JSON = T.RawValue
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> T? {
        if let raw = value as? T.RawValue {
            return T(rawValue:raw)
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: T?) -> T.RawValue? {
        if let obj = value {
            return obj.rawValue
        }
        
        return nil
    }
}
