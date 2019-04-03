//
//  CountryListButton.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 03/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class CountryListButton: UIButton {
    override func awakeFromNib() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.tintColor = UIColor.black
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
    }
}
