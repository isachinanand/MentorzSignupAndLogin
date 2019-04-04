//
//  ApiCollection.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya


enum ApiCollection {
    case registerViaPhoneNumber(withUser:LoginRequest)
    case loginViaPhoneNumber(forRequest:LoginRequest)
    case socialRegister(withUser:LoginRequest)
    case socialLogin(withRequest:LoginRequest)
}



func getBaseUrl()->String {
    let url = "http://stgapp.mentorz.com:8080"
    return url
}

enum apiVersion:String{
    case v1 = "v1"
    case v2 = "v2"
    case v3 = "v3"
}

extension ApiCollection:TargetType {
    
    var baseURL: URL {
        return /URL(string: getBaseUrl())
    }
    
    var path: String {
        switch self {
        case .registerViaPhoneNumber( _):
            return "mentorz/api/\(apiVersion.v3.rawValue)/user"
        case .loginViaPhoneNumber(forRequest: _):
            return "mentorz/api/\(apiVersion.v3.rawValue)/user/login"
        case .socialRegister(withUser: _):
            return "mentorz/api/\(apiVersion.v3.rawValue)/user/social"
        case .socialLogin(withRequest: _):
            return "mentorz/api/\(apiVersion.v3.rawValue)/user/sociallogin"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .registerViaPhoneNumber(withUser: _),.socialRegister(withUser: _):
            return .put
        case .loginViaPhoneNumber(forRequest: _),.socialLogin(withRequest: _):
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch  self {
        
        case .registerViaPhoneNumber(withUser: let user):
            return .requestParameters(parameters: user.toJSON(), encoding: JSONEncoding.default)
        case .loginViaPhoneNumber(forRequest:let request):
            return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        case .socialRegister(withUser: let user):
            return .requestParameters(parameters: user.toJSON(), encoding: JSONEncoding.default)
        case .socialLogin(withRequest: let request):
            return .requestParameters(parameters: request.toJSON(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .registerViaPhoneNumber(withUser: _),.socialRegister(withUser: _):
            return [
                "Accept":"application/json",
                "Content-Type": "application/json",
                "User-Agent":"abcdefgh"
                
            ]
        case .loginViaPhoneNumber(forRequest: _),.socialLogin(withRequest: _):
            return [
                "Accept":"application/json",
                "Content-Type": "application/json",
                "User-Agent":"abcdefgh"
            ]
        }
    }
    
    
}

