//
//    RootClass.swift
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import ObjectMapper


class LoginRequest: NSObject, Mappable{
    
    var deviceInfo : DeviceInfo?
    var password : String?
    var email_id : String?
    var phoneNumber : PhoneNumber?
    var userProfile : UserProfile?
    var socialId : String?
    var socialSource : String?
    
    override public init() {
        super.init()
    }
    
    required  init?(map: Map) {
        
    }
 
    
    func mapping(map: Map)
    {
        deviceInfo <- map["device_info"]
        password <- map["password"]
        phoneNumber <- map["phone_number"]
        userProfile <- map["user_profile"]
        email_id <- map["email_id"]
        socialId <- map["social_id"]
        socialSource <- map["social_source"]
    }
}
