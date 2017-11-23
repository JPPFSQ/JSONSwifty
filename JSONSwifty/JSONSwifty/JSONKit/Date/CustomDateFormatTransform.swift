//
//  CustomDateFormatTransform.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/23.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import Foundation

open class CustomDateFormatTransform: DateFormatterTransform {
    public init(formatString: String) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = formatString
        super.init(dateFormatter: formatter)
    }
}
