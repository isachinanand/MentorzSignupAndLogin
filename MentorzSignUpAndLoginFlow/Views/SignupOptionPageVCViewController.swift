//
//  SignupOptionPageVCViewController.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignupOptionPageVCViewController: UIViewController {
   private var usercredentialController:UserCredentialController = UserCredentialController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func alreadyRegisteredUserPressed(_ sender: UIButton) {
        for vc in self.navigationController?.viewControllers ?? [UIViewController]() {
            if vc is LoginScreen{
                self.navigationController?.popToViewController(vc, animated: true)
                return;
            }
        }
        let loginvc = UIStoryboard.init(name: "LoginStoryBoard", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
        self.navigationController?.pushViewController(loginvc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func signupViaPhonePressed(_ sender: MentorzButton) {
        
        let signupByPhone = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupScreen") as! SignupScreen
        signupByPhone.usercredentials = self.usercredentialController
        self.navigationController?.pushViewController(signupByPhone, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    

}
