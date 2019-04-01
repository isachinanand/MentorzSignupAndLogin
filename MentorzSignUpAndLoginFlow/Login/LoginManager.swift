//
//  LoginManager.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya
class LoginManager: NSObject {
    let loginProvider = MoyaProvider<ApiCollection>()
    func loginUserWithPhone(user:LoginRequest,handler: @escaping ((Int,LoginWithUserResponse?)->(Void))) {
        loginProvider.request(.loginViaPhoneNumber(forRequest:user)) {(response) in
            switch response{
            case .success(let result):
                let responseString = String(data: result.data, encoding:String.Encoding.ascii) ?? ""
                handler(result.statusCode,LoginWithUserResponse(JSONString: responseString))
                
            case .failure(let error):
                print("bad :(")
                
                handler(error.response?.statusCode ?? -1000, nil)
            }
            
        }
    }
    func loginUserWithSocial(user:LoginRequest,handler: @escaping ((Int)->(Void))) {
        loginProvider.request(.socialLogin(withRequest:user)) {(response) in
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
