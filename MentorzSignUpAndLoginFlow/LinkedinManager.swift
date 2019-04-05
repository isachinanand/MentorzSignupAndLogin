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
   let linkedinHelper = LinkedinSwiftHelper.init(configuration: LinkedinSwiftConfiguration.init(clientId: "77tn2ar7gq6lgv", clientSecret: "iqkDGYpWdhf7WKzA", state: "DLKDJF45DIWOERCM", permissions: ["r_basicprofile", "r_emailaddress"], redirectUrl: nil))
    func loginLinkedin(handler:@escaping ((Error?)->(Void))){
        linkedinHelper.authorizeSuccess({ (liToken) in
            <#code#>
        }, error: { (error) in
            handler(error)
        }) {
            <#code#>
        }
}
    func fetchProfile(handler:@escaping ((Error?)->(Void))){
        linkedinHelper.requestURL("https://api.linkedin.com/v1/people/~?format=json",
                                  requestType: LinkedinSwiftRequestGet,
                                  success: { (response) -> Void in
                                    
                                    //Request success response
                                    
        }) { [unowned self] (error) -> Void in
            
            //Encounter error
            handler(error)
        }
    }
    
}
