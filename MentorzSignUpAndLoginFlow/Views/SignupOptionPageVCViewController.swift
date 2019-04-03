//
//  SignupOptionPageVCViewController.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignupOptionPageVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func alreadyRegisteredUserPressed(_ sender: UIButton) {
    }
    @IBAction func signupViaPhonePressed(_ sender: MentorzButton) {
        
        let signupByPhone = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "SignupScreen") as! SignupScreen
        self.navigationController?.pushViewController(signupByPhone, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    

}
