//
//  RegistrationManager.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya
class RegistrationManager: NSObject {
    
     static let shared = RegistrationManager()
     let signupProvider = MoyaProvider<ApiCollection>()
    func registerUserWithPhone(user:LoginRequest,handler: @escaping ((Int)->(Void))) {
        signupProvider.request(.registerViaPhoneNumber(withUser: user)) {(response) in
            switch response{
            case .success(let result):
                print("good :p")
                handler(result.statusCode)
            case .failure(let error):
                print("bad :(")
                
                handler(error.response?.statusCode ?? -1000)
            }
            
        }
    }
    func registerUserWithSocial(user:LoginRequest,handler: @escaping ((Int)->(Void))) {
        signupProvider.request(.socialRegister(withUser: user)) {(response) in
            switch response{
            case .success(let result):
                print("good :p")
                handler(result.statusCode)
            case .failure(let error):
                print("bad :(")
                
                handler(error.response?.statusCode ?? -1000)
            }
            
        }
    }
}
