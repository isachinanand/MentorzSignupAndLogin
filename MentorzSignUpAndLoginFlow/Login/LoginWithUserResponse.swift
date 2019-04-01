//
//  RegisterWithUserResponse.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//



import Foundation
import ObjectMapper


class LoginWithUserResponse : NSObject,Mappable{
    
    var authToken : String?
    var hasInterests : Bool?
    var hasValues : Bool?
    var isAccountDeactivated : Bool?
    var isNumberVerified : Bool?
    var name : String?
    var phoneNumber : PhoneNumber?
    var userId : Int?
    var userProfile : UserProfile?
    
    
    
    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        authToken <- map["auth_token"]
        hasInterests <- map["has_interests"]
        hasValues <- map["has_values"]
        isAccountDeactivated <- map["is_account_deactivated"]
        isNumberVerified <- map["is_number_verified"]
        name <- map["name"]
        phoneNumber <- map["phone_number"]
        userId <- map["user_id"]
        userProfile <- map["user_profile"]
        
    }
    
}
