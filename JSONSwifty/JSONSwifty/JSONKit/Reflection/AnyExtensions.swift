//
//  AnyExtensions.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/20.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

protocol AnyExtensions {}

extension AnyExtensions {
    public static func isValueTypeOrSubType(_ value: Any) -> Bool {
        return value is Self
    }
    
    public static func value(from storage: UnsafeRawPointer) -> Any {
        return storage.assumingMemoryBound(to: self).pointee
    }
    
    public static func write(_ value: Any, to storage: UnsafeMutableRawPointer) {
        guard let this = value as? Self else {
            return
        }
        
        storage.assumingMemoryBound(to: self).pointee = this
    }
    
    public static func takeValue(from anyValue: Any) -> Self? {
        return anyValue as? Self
    }
}

func extensions(of type: Any.Type) -> AnyExtensions.Type {
    struct Extensions: AnyExtensions {}
    var extensions: AnyExtensions.Type = Extensions.self
    withUnsafePointer(to: &extensions) { pointer in
        UnsafeMutableRawPointer(mutating: pointer).assumingMemoryBound(to: Any.Type.self).pointee = type
    }
    
    return extensions
}

func extensions(of value: Any) -> AnyExtensions {
    struct Extensions: AnyExtensions {}
    var extensions: AnyExtensions = Extensions()
    withUnsafePointer(to: &extensions) { pointer in
        UnsafeMutableRawPointer(mutating: pointer).assumingMemoryBound(to: Any.self).pointee = value
    }
    
    return extensions
}

// Tests if 'value' is 'type' or a subclass of 'type'
func value(_ value: Any, is type: Any.Type) -> Bool {
    return extensions(of: type).isValueTypeOrSubType(value)
}

// TEsts equality of any two extensional types
func == (lhs: Any.Type, rhs: Any.Type) -> Bool {
    return Metadata(type: lhs) == Metadata(type: rhs)
}

// MARK: AnyExtension + Storage
extension AnyExtensions {
    mutating func storage() -> UnsafeRawPointer {
        if type(of: self) is AnyClass {
            let opaquePointer = Unmanaged.passUnretained(self as AnyObject).toOpaque()
            return UnsafeRawPointer(opaquePointer)
        } else {
            return withUnsafePointer(to: &self) { pointer in
                return UnsafeRawPointer(pointer)
            }
        }
    }
}
