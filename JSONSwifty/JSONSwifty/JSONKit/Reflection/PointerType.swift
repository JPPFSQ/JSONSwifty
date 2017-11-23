//
//  PointerType.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/22.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

protocol PointerType: Equatable {
    associatedtype Pointee
    var pointer: UnsafePointer<Pointee> { get set }
}

extension PointerType {
    init<T>(pointer: UnsafePointer<T>) {
        func cast<T,U>(_ value: T) -> U {
            return unsafeBitCast(value, to: U.self)
        }
        
        self = cast(UnsafePointer<Pointee>(pointer))
    }
}

func == <T: PointerType>(lhs: T, rhs: T) -> Bool {
    return lhs.pointer == rhs.pointer
}
