//
//  ISO8601DateTransform.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/23.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

open class ISO8601DateFormatter: DateFormatterTransform {
    public init() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH-mm-ssZZZZZ"
        super.init(dateFormatter: formatter)
    }
}
