//
//  UserProfileRegisterResponse.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//



import Foundation
import ObjectMapper


class UserProfileLoginResponse :NSObject,Mappable{
    
    var basicInfo : String?
    var birthDate : Int?
    var chargePrice : Int?
    var followers : Int?
    var following : Int?
    var hresId : String?
    var lresId : String?
    var mentees : Int?
    var mentors : Int?
    var name : String?
    var noofpost : Int?
    var requests : Int?
    var videoBioHres : String?
    var videoBioLres : String?
    var email_id : String?
    
    
    
    required init?(map: Map){}
    
    
    func mapping(map: Map)
    {
        basicInfo <- map["basic_info"]
        birthDate <- map["birth_date"]
        chargePrice <- map["charge_price"]
        followers <- map["followers"]
        following <- map["following"]
        hresId <- map["hres_id"]
        lresId <- map["lres_id"]
        mentees <- map["mentees"]
        mentors <- map["mentors"]
        name <- map["name"]
        noofpost <- map["noofpost"]
        requests <- map["requests"]
        videoBioHres <- map["video_bio_hres"]
        videoBioLres <- map["video_bio_lres"]
        email_id <- map["email_id"]
        
        
    }
    
    
    
}
