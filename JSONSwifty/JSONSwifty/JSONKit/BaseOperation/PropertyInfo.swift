//
//  PropertyInfo.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/19.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

struct PropertyInfo {
    let key: String
    let type: Any.Type
    let address: UnsafeMutableRawPointer
    let bridged: Bool
}
