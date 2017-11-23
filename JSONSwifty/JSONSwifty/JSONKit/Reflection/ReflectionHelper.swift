//
//  ReflectionHelper.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/22.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

struct ReflectionHelper {
    static func mutableStorage<T>(instance: inout T) -> UnsafeMutableRawPointer {
        return UnsafeMutableRawPointer(mutating: storage(instance: &instance))
    }
    
    static func storage<T>(instance: inout T) -> UnsafeRawPointer {
        if type(of: instance) is AnyClass {
            let opaquePointer = Unmanaged.passUnretained(instance as AnyObject).toOpaque()
            return UnsafeRawPointer(opaquePointer)
        } else {
            return withUnsafePointer(to: &instance) { pointer in
                return UnsafeRawPointer(pointer)
            }
        }
    }
}
