//
//  OtherExtension.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/20.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

protocol UTF8Initializable {
    init?(validatingUTF8: UnsafePointer<CChar>)
}

extension String: UTF8Initializable {}

extension Array where Element: UTF8Initializable {
    init(utf8Strings: UnsafePointer<CChar>) {
        var strings = [Element]()
        var pointer = utf8Strings
        while let string = Element(validatingUTF8: pointer) {
            strings.append(string)
            while pointer.pointee != 0 {
                pointer.advanced()
            }
            pointer.advanced()
            guard pointer.pointee != 0 else {
                break
            }
        }
        self = strings
    }
}

extension Strideable {
    mutating func advanced() {
        self = advanced(by: 1)
    }
}

extension UnsafePointer {
    init<T>(_ pointer: UnsafePointer<T>) {
        self = UnsafeRawPointer(pointer).assumingMemoryBound(to: Pointee.self)
    }
}

func relativePointer<T,U,V>(base: UnsafePointer<T>, offset: U) -> UnsafePointer<V> where U: Integer {
    return UnsafeRawPointer(base).advanced(by: Int(integer: offset)).assumingMemoryBound(to: V.self)
}

extension Int {
    fileprivate init<T: Integer>(integer: T) {
        switch integer {
        case let value as Int: self = value
        case let value as Int32: self = Int(value)
        case let value as Int16: self = Int(value)
        case let value as Int8: self = Int(value)
        default: self = 0
        }
    }
}
