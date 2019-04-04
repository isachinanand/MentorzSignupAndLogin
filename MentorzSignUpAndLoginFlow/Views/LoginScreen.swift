//
//  LoginScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginScreen: UIViewController,countryCodeDelegate {
    
    func getcountryCode(code: Country) {
        self.code.setTitle("+" + /code.countryCode, for: .normal)
        let phone = /usercredentials.phonenumber
        phone.cc  = code.countryCode
        phone.isoAlpha2Cc = code.iso
        self.usercredentials.phonenumber = phone
    }
    
    private var usercredentials : UserCredentialController  = UserCredentialController()
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
    @IBAction func fbLoginButtonPressed(_ sender: MentorzButton) {
        FBManager.init().login(onViewController: self) { (userprofile, error) -> (Void) in
            if let fbuser = userprofile {
                print(fbuser.id)
            }else{
                print("errrorrrrrr",error)
            }
        }
    }
    
    @IBAction func linkedinLoginPressed(_ sender: MentorzButton) {
    }
    
    @IBAction func loginButtonPressed(_ sender: MentorzButton) {
        
    }
    
   
}
