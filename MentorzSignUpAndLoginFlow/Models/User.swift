//
//  User.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
class User:NSObject{
    
    var authToken : String?
    var hasInterests : Bool?
    var hasValues : Bool?
    var isAccountDeactivated : Bool?
    var isNumberVerified : Bool?
    var name : String?
    var phoneNumber : PhoneNumber?
    var userId : Int?
    var userProfile : UserProfileLoginResponse?
    override public init() {
        super.init()
    }
    convenience init (withResponse: LoginWithUserResponse)
    {   self.init()
        self.authToken = withResponse.authToken
        self.hasInterests = withResponse.hasInterests
        self.hasValues = withResponse.hasValues
        self.isAccountDeactivated = withResponse.isAccountDeactivated
        self.isNumberVerified = withResponse.isNumberVerified
        self.name = withResponse.name
        self.userId = withResponse.userId
        self.phoneNumber = withResponse.phoneNumber
        self.userProfile = withResponse.userProfile
        
    }
    
}
