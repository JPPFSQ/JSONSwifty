//
//  TransformType.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/22.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

public protocol TransformType {
    associatedtype Object
    associatedtype JSON
    
    func transformFromJSON(_ value: Any?) -> Object?
    func transformToJSON(_ value: Object?) -> JSON?
}
