//
//  ChangePassword.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 02/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import Moya
class ChangePasswordManager {
    let changePassAPI = MoyaProvider<UserAccountApiCollection>()
    func changePassword(user:LoginRequest,handler: @escaping ((Int)->(Void))){
        changePassAPI.request(.changePassword(withRequest: user)){(response) in
            
        }
    }
}
