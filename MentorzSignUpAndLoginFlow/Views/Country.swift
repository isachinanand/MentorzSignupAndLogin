//
//  Country.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 05/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit

class Country: NSObject {
    
    var name:String?
    var code:String?
    var isSelected:Bool = false
    
    init(name:String , code:String) {
        self.name = name;
        self.code = code;
        
        super.init();
    }
    
}
struct XML {
    
    private init(){}
    
    static let fileExtension:String = "xml"
    static let countries:String = "countries"
    
    struct Tag {
        
        private init(){}
        
        static let country = "country"
        
        struct Attribute {
            
            private init(){}
            
            static let name = "name"
            static let phoneCode = "phoneCode"
        }
        
        
    }
    
}
