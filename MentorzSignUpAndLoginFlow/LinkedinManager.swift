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
class LinkedinProfile{
    var id:String
    var name:String
    var email:String
    private init() {
        id = ""
        name = ""
        email = ""
    }
    convenience init?(fromLinkedinResponse:[String:Any]) {
        guard let id = fromLinkedinResponse["id"] as? String else { return nil }
        guard let name = fromLinkedinResponse["name"] as? String else { return nil }
        guard let email = fromLinkedinResponse["email"] as? String else { return nil }
        self.init()
        self.id = id
        self.email = email
        self.name = name
    }
}
class LinkedinManager {
    let linkedinHelper = LinkedinSwiftHelper(configuration:
        LinkedinSwiftConfiguration(
            clientId:"75k3gdbsqbrx1i",
            clientSecret:"sXfZjmjDOLIu6M8l",
            state: "ARANDOMSTRING",
            permissions: ["r_basicprofile", "r_emailaddress"], redirectUrl: "https://com.mentorz.linkedin.oauth/oauth"
        ), nativeAppChecker: WebLoginOnly()
    )
    func LinkedinLogin(handler:@escaping ((Error?,LinkedinProfile?)->(Void)))
    {
        linkedinHelper.authorizeSuccess({ (lsToken) -> Void in
            //Login success lsToken
            print(lsToken)
            self.fetchProfile(handler: { (error, profile) -> (Void) in
                handler(error,profile)
            })
        }, error: { (error) -> Void in
            print(error)
            handler(error,nil)
            //Encounter error: error.localizedDescription
        }, cancel: { () -> Void in
            //User Cancelled!
            handler(nil,nil)
            print("Login cancel")
        })
    }
    func fetchProfile(handler:@escaping ((Error?,LinkedinProfile?)->(Void))){
        linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~?format=json",
                                  requestType: LinkedinSwiftRequestGet,
                                  success: { (response) -> Void in
                            
                                    //Request success response
                                  print(response)
                                    print("ds")
        }) { (error) -> Void in
            
            //Encounter error
            handler(error,nil)
        }
    }
    
}
