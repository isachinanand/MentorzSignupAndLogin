//
//  LoginScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SVProgressHUD

class LoginScreen: UIViewController,CountryCodeDelegate {
    func didSelectCountryCode(country: Country) {
        self.code.setTitle(/country.code, for: .normal)
        let phone = /usercredentials.phonenumber
        phone.cc  = country.code
        phone.isoAlpha2Cc = country.iso
        self.usercredentials.phonenumber = phone
    }
    
    
    
    
    private var usercredentials : UserCredentialController  = UserCredentialController()
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var code: CountryListButton!
    @IBAction func countryCodePressed(_ sender: CountryListButton) {
        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryCodeVC") as! CountryCodeVC
        vc.delegate = self
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
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phoneField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
    }
    @IBAction func fbLoginButtonPressed(_ sender: MentorzButton) {
        FBManager.init().login(onViewController: self) { (userprofile, error) -> (Void) in
            if let fbuser = userprofile {
                print(fbuser.id)
            }else{
                SVProgressHUD.showError(withStatus: "\(/error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func linkedinLoginPressed(_ sender: MentorzButton) {
    }
    
    @IBAction func loginButtonPressed(_ sender: MentorzButton) {
        SVProgressHUD.show(withStatus: "Logging In")
        self.usercredentials.loginUser { (statusCode, newuser) in
            SVProgressHUD.dismiss()
            if let user = newuser{
                print(user)
                let vc = UIStoryboard.init(name: "LoginStoryBoard", bundle: Bundle.main).instantiateViewController(withIdentifier: "AfterLoginScreen") as! AfterLoginScreen
                self.navigationController?.pushViewController(vc, animated: true)
            } else if(statusCode==400){
                SVProgressHUD.showError(withStatus: "Bad Request")
            }else if(statusCode==401){
                SVProgressHUD.showError(withStatus: "Unauthozied")
            }else if(statusCode==403){
                SVProgressHUD.showError(withStatus: "Forbidden")
            }else if(statusCode==404){
                SVProgressHUD.showError(withStatus: "Not Found")
            }
            
        }
    }
    
    
}
extension LoginScreen:UITextFieldDelegate{
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == emailField{
            self.usercredentials.email = textField.text
        }else if textField == phoneField{
            self.usercredentials.phonenumber?.number = textField.text
        }else if textField == passwordField{
            self.usercredentials.password = textField.text
        }else {
            
        }
        
        
    }
}

