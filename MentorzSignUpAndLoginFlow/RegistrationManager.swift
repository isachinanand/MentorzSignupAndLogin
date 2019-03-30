//
//  RegistrationManager.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya
public class RegistrationManager: NSObject {
    
    public static let shared = RegistrationManager()
    private let signupProvider = MoyaProvider<ApiCollection>()
    func registerUser(newUser:User,handler: @escaping ((Int,User?)->Void)){
        signupProvider.request(.registerViaPhoneNumber(withUser: newUser){ (response)
            
            }, completion: <#T##Completion##Completion##(Result<Response, MoyaError>) -> Void#>)
        
    }
    /*
     open func registerUser(newRegistrationRequest:userDetailsRequest , handler: @escaping ( (Int,userDetailsRequest?)->Void ) ){
     signupProvider.request(.registerUser(withUser: newRegistrationRequest)) { (response) in
     
     //            debug
     let debug_info = String(format: "new user Registration with request %@ \n response from server is %@ \n dubug desc is %@", newRegistrationRequest.toSafeJSON(),String(data:response.value?.data ?? Data(), encoding: String.Encoding.ascii) ?? "Manual Text:-No data Found on Server" , response.debugDescription)
     DDLogInfo(debug_info)
     
     switch response{
     case .success(let result):
     let responseString = String(data: result.data, encoding: String.Encoding.ascii)
     let userResponse = userDetailsRequest(JSONString: responseString ?? "")
     if let headers = result.response?.allHeaderFields as? [String:String]  {
     UserManager.shared.setAccesToken(fromHeader: headers)
     }
     handler(result.statusCode,userResponse)
     case .failure(let error):
     print(error)
     handler(response.error?.response?.statusCode ?? -1000,nil)
     }
     }
     }
 */
}

