//
//  HexColorTransform.swift
//  JSONSwifty
//
//  Created by Shaoqing Fan on 2017/9/22.
//  Copyright © 2017年 Shaoqing Fan. All rights reserved.
//

import UIKit

open class HexColorTransform: TransformType {
    public typealias Object = UIColor
    public typealias JSON = String
    
    var prefix: Bool = false
    var alpha: Bool = false
    
    public init(prefixToJSON: Bool = false, alphaToJSON: Bool = false) {
        alpha = alphaToJSON
        prefix = prefixToJSON
    }
    
    open func transformFromJSON(_ value: Any?) -> Object? {
        if let rgba = value as? String {
            if rgba.hasPrefix("#") {
                let index = rgba.characters.index(rgba.startIndex, offsetBy: 1)
                let hex = rgba.substring(from: index)
                return getColor(hex: hex)
            } else {
                return getColor(hex: rgba)
            }
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: UIColor?) -> JSON? {
        if let value = value {
            return hexString(color: value)
        }
        
        return nil
    }
    
    fileprivate func hexString(color: Object) -> String {
        let comps = color.cgColor.components!
        let r = Int(comps[0] * 225)
        let g = Int(comps[1] * 225)
        let b = Int(comps[2] * 225)
        let a = Int(comps[3] * 225)
        
        var hexString: String = ""
        if prefix {
            hexString = "#"
        }
        hexString += String(format: "%02X%02X%02X", r,g,b)
        
        if alpha {
            hexString += String(format: "%02X", a)
        }
        return hexString
    }
    
    fileprivate func getColor(hex: String) -> Object? {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch hex.characters.count {
            case 3:
                red     = CGFloat((hexValue & 0xF00) >> 8)          / 15.0
                green   = CGFloat((hexValue & 0x0F0) >> 4)          / 15.0
                blue    = CGFloat(hexValue & 0x00F)                 / 15.0
            case 4:
                red     = CGFloat((hexValue & 0xF000) >> 12)        / 15.0
                green   = CGFloat((hexValue & 0x0F00) >> 8)         / 15.0
                blue    = CGFloat((hexValue & 0x00F0) >> 4)         / 15.0
                alpha   = CGFloat(hexValue & 0x000F)                / 15.0
            case 6:
                red     = CGFloat((hexValue & 0xFF0000) >> 16)      / 255.0
                green   = CGFloat((hexValue & 0x00FF00) >> 8)       / 255.0
                blue    = CGFloat(hexValue & 0x0000FF)              / 255.0
            case 8:
                red     = CGFloat((hexValue & 0xFF000000) >> 24)    / 255.0
                green   = CGFloat((hexValue & 0x00FF0000) >> 16)    / 255.0
                blue    = CGFloat((hexValue & 0x0000FF00) >> 8)     / 255.0
                alpha   = CGFloat(hexValue & 0x000000FF)            / 255.0
            default:
                // Invalid RGB string, number of characters after '#' should be either 3,4,6 or 8
                return nil
            }
        } else {
            // Scan hex error
            return nil
        }
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
