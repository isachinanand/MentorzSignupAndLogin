//
//  FBManager.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import FBSDKLoginKit
class FBProfile{
    var id:String
    var name:String
    var email:String
    private init() {
        id = ""
        name = ""
        email = ""
    }
    convenience init?(fromFBResponse:[String:Any]) {
        guard let id = fromFBResponse["id"] as? String else { return nil }
        guard let name = fromFBResponse["name"] as? String else { return nil }
        guard let email = fromFBResponse["email"] as? String else { return nil }
        self.init()
        self.id = id
        self.email = email
        self.name = name
    }
}
class FBManager{
    func login(onViewController:UIViewController, handler: @escaping ((FBProfile?,Error?)->(Void))  ){
        FBSDKLoginManager.init().logIn(withReadPermissions: ["email","public_profile"], from: onViewController) { (result, error) in
            if error != nil{
                handler(nil,error)
            }else{
                FBSDKGraphRequest.init(graphPath: "me?fields=id,name,birthday,email,picture,link", parameters: [:])?.start(completionHandler: { (info, call, error) in
                    if error != nil{
                        handler(nil,error)
                    }else{
                        guard let dictonary = call as? [String:Any] else {
                            handler(nil,NSError.init(domain: "FBManager", code: 0, userInfo: nil) )
                            return
                        }
                        handler(FBProfile(fromFBResponse: dictonary),error)
                    }
                })
            }
        }
    }
    func register(onViewController:UIViewController,handler: @escaping ((FBProfile?,Error?)->(Void))) {
        
    }
}
