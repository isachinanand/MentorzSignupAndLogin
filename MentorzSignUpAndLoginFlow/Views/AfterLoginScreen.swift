//
//  AfterLoginScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class AfterLoginScreen: UIViewController {
var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
nameLabel.text = name
        // Do any additional setup after loading the view.
    }
    var usercredential = UserCredentialController.init(isLogin: true)
    @IBOutlet weak var nameLabel: UILabel!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
