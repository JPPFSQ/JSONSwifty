//
//  ExtendCustomBasicType.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/19.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

public protocol _ExtendCustomBasicType: _Transformable {
    static func _transform(from object: Any) -> Self?
    func _plainValue() -> Any?
}
