//
//  UserAccountAPI.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya

enum UserAccountApiCollection{
    case changePassword(withRequest:LoginRequest)
}
extension UserAccountApiCollection:TargetType {
    var baseURL: URL {
        return /URL(string:getBaseUrl())
    }
    
    var path: String {
        switch  self {
        case .changePassword(withRequest: _):
            return "mentorz/api/\(apiVersion.v3.rawValue)/user/updatepassword"
        
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .changePassword(withRequest: _):
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
       
        case .changePassword(withRequest: let request):
            return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch  self {
        case .changePassword(withRequest: _):
            return [
                "Accept":"application/json",
                "Content-Type": "application/json",
                "User-Agent":"abcdefgh"
                
            ]

        }
    }
    
    
}
