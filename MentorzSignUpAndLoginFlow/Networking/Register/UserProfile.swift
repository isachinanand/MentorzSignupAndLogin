//
//  User.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import ObjectMapper


class UserProfile: NSObject, Mappable{
    
    var basicInfo : String?
    var birthDate : String?
    var name : String?
    var videoBioHres : String?
    var hresId : String?
    var lresId : String?
    var videoBioLres : String?
   
   
    required init?(map: Map){}
    func mapping(map: Map)
    {
        basicInfo <- map["basic_info"]
        birthDate <- map["birth_date"]
        name <- map["name"]
        videoBioHres <- map["video_bio_hres"]
        hresId <- map["hres_id"]
        lresId <- map["lres_id"]
        videoBioLres <- map["video_bio_lres"]
    }
}
