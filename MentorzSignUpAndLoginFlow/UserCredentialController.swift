//
//  UserCredentialController.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class UserCredentialController: NSObject {
    private var firebaseManager = FireBaseManager()
    private var request = LoginRequest()
    private var loginManager = LoginManager()
    override private init() {
        super.init()
        
    
    }
    convenience init(isRegistration:Bool){
        self.init()
        self.request.deviceInfo = DeviceInfo(deviceToken: /UIDevice.current.identifierForVendor?.uuidString, deviceType: "iOS")
        self.request.phoneNumber = PhoneNumber()
        self.request.userProfile = UserProfile()
        
    }
    convenience init(isLogin:Bool){
        self.init()
        self.request.deviceInfo = DeviceInfo(deviceToken: /UIDevice.current.identifierForVendor?.uuidString, deviceType: "iOS")
        self.request.phoneNumber = PhoneNumber()
        
    }
    var name:String?{
        get{
            return request.userProfile?.name
        }
        set{
          request.userProfile?.name = newValue
        }
    }
    var password:String?{
        get{
            return request.password
        }
        set{
            request.password = newValue
        }
    }
    var email:String?{
        get{
            return request.email_id
        }
        set{
            request.email_id = /newValue
        }
    }
    var phonenumber:PhoneNumber?{
        get{
            return request.phoneNumber
        }
        set{
            request.phoneNumber = newValue
        }
    }
    var socialId: String?{
        get{
            return request.socialId
        }
        set{
            request.socialId = /newValue
        }
    }
    
    func sendOTP(handler: @escaping ( (Error?)->() ) ){
        firebaseManager.verifyPhone(phoneNumber: /self.phonenumber) { (error) -> (Void) in
            handler(error)
        }
    }
    func verifyOTP(code:String,handler: @escaping ( (Error?)->() ) ){
        firebaseManager.matchOTP(verificationCode: code) { (error) -> (Void) in
            handler(error)
        }
    }
    func registerUser(handler: @escaping ((Bool,Int)->())){
        if request.socialId == nil{
            RegistrationManager.init().registerUserWithPhone(user: request) { (statusCode) -> (Void) in
                handler(statusCode == 201,statusCode)
            }
        }else{
            RegistrationManager.init().registerUserWithSocial(user: request) { (statuscode) -> (Void) in
                handler(statuscode == 201,statuscode)
            }
        }
    }
    func loginUser(handler: @escaping ((Int,User?)->()))
    {
        if request.socialId == nil{
            loginManager.loginUserWithPhone(user: request)
            {(statusCode,user) -> (Void) in
                if let response = user{
                    let newuser = User(withResponse: response)
                    handler(statusCode,newuser)
                }else{
                    handler(statusCode,nil)
                }
            }
        }else{
            loginManager.loginUserWithSocial(user: request)
            {(statusCode,user) -> (Void) in
                if let response = user{
                    let newuser = User(withResponse: response)
                    UserManager.shared.user = newuser
                    handler(statusCode,newuser)
                }else{
                    handler(statusCode,nil)
                }
            }
        }
    }
}
