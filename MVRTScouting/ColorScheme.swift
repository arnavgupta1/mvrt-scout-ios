//
//  ColorScheme.swift
//  MVRTScouting
//
//  Created by Alex Erf on 3/3/15.
//  Copyright (c) 2015 MVRT. All rights reserved.
//

import Foundation
import UIKit

func colorFromHex(hex : UInt) -> UIColor {
    return UIColor(red: CGFloat(((hex & 0xFF0000) >> 16)) / 255.0, green: CGFloat(((hex & 0xFF00)) >> 8) / 255.0, blue: CGFloat((hex & 0xFF)) / 255.0, alpha: 1.0)
}

enum Colors : UInt {
    case Purple = 0x673AB7
    case Gold = 0xFFC107
    case Emerald = 0x2ECC71
    
    func toColor() -> UIColor {
        return colorFromHex(self.rawValue)
    }
}