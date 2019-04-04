//
//  LoginScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController,countryCodeDelegate {
    func getcountryCode(code: Country) {
        self.code.setTitle("+" + /code.countryCode, for: .normal)
        req.phoneNumber?.cc = code.countryCode
        req.phoneNumber?.isoAlpha2Cc = code.iso
    }
    
    
    let req = LoginRequest()
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var code: CountryListButton!
    @IBAction func countryCodePressed(_ sender: CountryListButton) {
        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryList") as! CountryList
        vc.delegateCode = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func newUserSignupPressed(_ sender: UIButton) {
        for vc in self.navigationController?.viewControllers ?? [UIViewController]() {
            if vc is SignupOptionPageVCViewController{
                self.navigationController?.popToViewController(vc, animated: true)
                return;
            }
            
            
        }
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func loginButtonPressed(_ sender: MentorzButton) {
        req.phoneNumber?.number = phoneField.text
        req.email_id = emailField.text ?? ""
        req.password = passwordField.text
        UserManager.shared.loginUser(request: req) { (statuscode, newuser) -> (Void) in
            
        }
        
    }
    
   
}
