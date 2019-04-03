//
//  LoginScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController,countryCodeDelegate {
    func getcountryCode(code: String) {
         self.code.setTitle("+"+code, for: .normal)
    }
    

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
    

   
}
