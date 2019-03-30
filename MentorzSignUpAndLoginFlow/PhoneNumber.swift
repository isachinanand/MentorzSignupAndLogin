//
//  PhoneNumber.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
open class PhoneNumber {
    public var cc:String?
    public var phoneNumber:String?
    var iso_name:String?
    init(_ cc:String,_ phoneNumber:String, _ iso:String) {
        self.iso_name = iso
        self.cc = cc
        self.phoneNumber = phoneNumber
    }
    public func toString()->String{
        return (self.cc ?? "") + ( self.phoneNumber ?? "")
}
}
