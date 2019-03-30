//
//  User.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
class User {
    public var phoneNumber: PhoneNumber?
    public var password: String?
    public var name: String?
    public var dateOfBirth: Date?
    public var basicInfo: String?
    
    init (_ phone: PhoneNumber,_ password: String,_ name: String,_ dateOfBirth: Date,_ basicInfo: String){
        self.phoneNumber = phone
        self.password = password
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.basicInfo = basicInfo
        
    }
}
/*
 {
 
 
 "phone_number":{
 "cc":"91",
 "iso_alpha_2_cc":"in",
 "number":"7206901139"
 },
 "password":"qwerty",
 "device_info": {
 "device_token": "testdtoken",
 "device_type":"IOS"
 },
 "user_profile":{
 "birth_date":"769564800000",
 "name":"Anuj New",
 "basic_info":"Java developer",
 "video_bio_hres":""
 
 }
 
 }
 
 */
