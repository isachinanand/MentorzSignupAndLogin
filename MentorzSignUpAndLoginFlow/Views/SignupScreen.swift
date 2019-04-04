//
//  SignupScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignupScreen: UIViewController,countryCodeDelegate {
    func getcountryCode(code: Country) {
        self.Code.setTitle("+" + /code.countryCode, for: .normal)
        req.phoneNumber?.cc = code.countryCode
        req.phoneNumber?.isoAlpha2Cc = code.iso
    }
    let req = LoginRequest()
    let firebase = FireBaseManager()
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    

    @IBOutlet weak var Code: CountryListButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       Code.setTitle("+1", for: .normal)
        req.phoneNumber = PhoneNumber(cc: "1", iso: "in", number: "0")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func countryCodeButtonPressed(_ sender: CountryListButton) {
        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryList") as! CountryList
        vc.delegateCode = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func alreadyRegisteredPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "LoginStoryBoard", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signupButtonPressed(_ sender: MentorzButton) {
        req.userProfile?.name = nameField.text
        req.phoneNumber?.number = phoneField.text
        req.password = passwordField.text
        firebase.verifyPhone(phoneNumber: /req.phoneNumber) { (error) -> (Void) in
            if error == nil {
                let otp = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "OTPScreen") as! OTPScreen
                otp.firebase = self.firebase
                self.navigationController?.pushViewController(otp, animated: true)
            }
        }
        
    }
    
    
}
