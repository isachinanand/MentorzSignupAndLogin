//
//  ViewController.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 30/03/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let req = LoginRequest()
        req.phoneNumber = PhoneNumber(cc: "91", iso: "in", number: "9501975529")
        req.password = "qwerty"
        req.deviceInfo = DeviceInfo(deviceToken: "123456789", deviceType: "ios")
        req.email_id = ""
        LoginManager().loginUserWithPhone(user: req) { (statusCode,responseString) -> (Void) in
            
        }
    }


}

