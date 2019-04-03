//
//  MentorzButton.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class MentorzButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
       // self.layer.backgroundColor = UIColor.init(red: 243/255, green: 52/255, blue: 52/255, alpha: 1).cgColor
        self.tintColor = .white
    }
    
}
