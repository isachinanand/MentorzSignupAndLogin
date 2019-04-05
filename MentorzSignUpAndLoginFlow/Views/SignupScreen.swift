//
//  SignupScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import SVProgressHUD
class SignupScreen: UIViewController,CountryCodeDelegate {
    func didSelectCountryCode(country: Country) {
        self.Code.setTitle("+" + /country.code, for: .normal)
        let phone = /usercredentials?.phonenumber
        phone.cc  = country.code
        phone.isoAlpha2Cc = ""
        self.usercredentials?.phonenumber = phone
    }
    
   
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var usercredentials:UserCredentialController?
    

    @IBOutlet weak var Code: CountryListButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       Code.setTitle("+1", for: .normal)
        nameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phoneField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func countryCodeButtonPressed(_ sender: CountryListButton) {
        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryCodeVC") as! CountryCodeVC
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func alreadyRegisteredPressed(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "LoginStoryBoard", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signupButtonPressed(_ sender: MentorzButton) {
        SVProgressHUD.show(withStatus: "sending OTP!")
        self.usercredentials?.sendOTP(handler: { (error) in
         SVProgressHUD.dismiss()
            if let err = error{
                SVProgressHUD.showError(withStatus: err.localizedDescription)
            }else{
                SVProgressHUD.showSuccess(withStatus: "Sent!")
                let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "OTPScreen") as! OTPScreen
                vc.usercredentials = self.usercredentials
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
    
    
}
extension SignupScreen:UITextFieldDelegate{
   @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == nameField{
            self.usercredentials?.name = textField.text
        }else if textField == phoneField{
            self.usercredentials?.phonenumber?.number = textField.text
        }else if textField == passwordField{
            self.usercredentials?.password = textField.text
        }else{
            
        }
    }
}
