//
//  LinkedinManager.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 05/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import LinkedinSwift
import UIKit
class LinkedinManager {
    let linkedinHelper = LinkedinSwiftHelper(configuration:
        LinkedinSwiftConfiguration(
            clientId:"75k3gdbsqbrx1i",
            clientSecret:"sXfZjmjDOLIu6M8l",
            state: "ARANDOMSTRING",
            permissions: ["r_basicprofile", "r_emailaddress"], redirectUrl: "https://com.mentorz.linkedin.oauth/oauth"
        ), nativeAppChecker: WebLoginOnly()
    )
    func LinkedinLogin()
    {
        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
            //Login success lsToken
            print(lsToken)
        }, error: { (error) -> Void in
            print(error)
            //Encounter error: error.localizedDescription
        }, cancel: { () -> Void in
            //User Cancelled!
            print("Login cancel")
        })
    }
    func fetchProfile(handler:@escaping ((Error?,[String:Any]?)->(Void))){
        linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~?format=json",
                                  requestType: LinkedinSwiftRequestGet,
                                  success: { (response) -> Void in
                                    let dict = response.jsonObject as? [String:Any]
                                    handler(nil,dict)
                                    //Request success response
                                    
        }) { [unowned self] (error) -> Void in
            
            //Encounter error
            handler(error,nil)
        }
    }
    
}
