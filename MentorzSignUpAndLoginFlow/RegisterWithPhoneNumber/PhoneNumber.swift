//
//  PhoneNumber.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

//
//    PhoneNumber.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class PhoneNumber : NSObject, Mappable{
    
    var cc : String?
    var isoAlpha2Cc : String?
    var number : String?
    
    
   
    override public init() {
        super.init()
    }
    
    required  init?(map: Map) {
        
    }
    convenience init(cc:String,iso:String,number:String) {
        self.init()
        self.cc = cc
        self.isoAlpha2Cc = iso
        self.number = number
    }
    func mapping(map: Map)
    {
        cc <- map["cc"]
        isoAlpha2Cc <- map["iso_alpha_2_cc"]
        number <- map["number"]
        
    }
    func getPhoneNumberInString ()->String {
        return "\(String(describing: cc))"+"\(String(describing: number))"
    }
    
}

