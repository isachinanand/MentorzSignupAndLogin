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
    var verificationId = ""
    func verifyPhone(phoneNumber:PhoneNumber){
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber.getPhoneNumberInString(), uiDelegate: nil) { (verificationID, error) in
            if let error = error {
               print("\(error.localizedDescription)")
                return
            }
            // Sign in using the verificationID and the code sent to the user
            // ...
        
    
    UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
    self.verificationId = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
}
}

func matchOTP(verificationCode:String)->Bool
{
    let credential = PhoneAuthProvider.provider().credential(
        withVerificationID: verificationId,
        verificationCode: verificationCode)
    Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
        if let error = error {
            print("\(error.localizedDescription)")
            return
        }
        // User is signed in
        // ...
    }
    
   return true
}
    
}
