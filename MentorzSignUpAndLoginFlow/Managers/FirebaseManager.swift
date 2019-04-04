//
//  FirebaseManager.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 01/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import FirebaseAuth
class FireBaseManager {
    private var verificationId = ""
    
    func verifyPhone(phoneNumber:PhoneNumber,handler: @escaping((Error?)->(Void))){
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber.getPhoneNumberInString(), uiDelegate: nil) { (verificationID, error) in
            self.verificationId = /verificationID
            handler(error)
        }
    }
    
    func matchOTP(verificationCode:String,handler: @escaping((Error?)->(Void)))
    {
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationId,
            verificationCode: verificationCode)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            handler(error)
        }
    }
    
}
