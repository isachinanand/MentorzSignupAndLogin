//
//  PrefixOperator.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

prefix operator /
public prefix func /(str: Substring?) -> String{
    return String(str ?? "")
}
public prefix func /(str: Int64?) -> Int64{
    return str ?? Int64(0)
}
public prefix func /(str: String?) -> String {
    return str ?? ""
}
public prefix func /(str: Int?) -> Int {
    return str ?? 0
}
public prefix func /(str: Bool?) -> Bool {
    return str ?? false
}
public prefix func /(str: Double?) -> Double {
    return str ?? 0.0
}

public prefix func /(str: Float?) -> Float {
    return str ?? 0.0
}

public prefix func /(str: CGFloat?) -> CGFloat {
    return str ?? 0.0
}

public prefix func /(str: URL?) -> URL {
    return str ?? URL(fileURLWithPath: "")
}
public prefix func /(str: PhoneNumber?) -> PhoneNumber{
    return str ?? PhoneNumber(cc: "91", iso: "in", number: "")
}


