//
//  SignupScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignupScreen: UIViewController,countryCodeDelegate {
    func getcountryCode(code: String) {
        self.Code.setTitle("+"+code, for: .normal)
    }
    
    

    @IBOutlet weak var Code: CountryListButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       Code.setTitle("+1", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func countryCodeButtonPressed(_ sender: CountryListButton) {
        let vc = UIStoryboard.init(name: "Signup", bundle: Bundle.main).instantiateViewController(withIdentifier: "CountryList") as! CountryList
        vc.delegateCode = self
        self.present(vc, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
