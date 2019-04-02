//
//  UserManager.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import Moya
class UserManager: NSObject {
    static var shared = UserManager()
    var user: User?
    
    func registerUser(request:LoginRequest,handler: @escaping ((Bool)->(Void))){
        if request.socialId == nil{
            RegistrationManager.init().registerUserWithPhone(user: request) { (statusCode) -> (Void) in
                handler(statusCode == 201)
            }
        }else{
            RegistrationManager.init().registerUserWithSocial(user: request) { (statuscode) -> (Void) in
                handler(statuscode == 201)
            }
        }
    }
    func loginUser(request:LoginRequest,handler: @escaping ((Int,User?)->(Void)))
    {
        if request.socialId == nil{
            LoginManager.init().loginUserWithPhone(user: request)
            {(statusCode,user) -> (Void) in
                if let response = user{
                    let newuser = User(withResponse: response)
                    handler(statusCode,newuser)
                }else{
                    handler(statusCode,nil)
                }
            }
        }else{
            LoginManager.init().loginUserWithSocial(user: request)
            {(statusCode,user) -> (Void) in
                if let response = user{
                    let newuser = User(withResponse: response)
                    handler(statusCode,newuser)
                }else{
                    handler(statusCode,nil)
                }
            }
            
            
            
        }
        
    }
}




