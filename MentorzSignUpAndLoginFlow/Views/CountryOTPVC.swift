//
//  CountryOTPVC.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 05/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import Foundation
import UIKit

class CountryCodeTVC: UITableViewCell {
    
    
    @IBOutlet weak var countryNamelbl: UILabel!
    @IBOutlet weak var countryCodelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpFontForCell()
        
    }
    
    //Font Setup
    func setUpFontForCell() {
       // countryCodelbl.font = UIFont.appFont(size: FontSize.basicTextFont)
        //countryNamelbl.font = UIFont.appFont(size: FontSize.basicTextFont)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(_ obj: AnyObject?) {
        
        if let cellObj = obj as? Country{
            
            countryNamelbl.text = cellObj.name
            countryCodelbl.text = cellObj.code
            handleSelectedCountryCode(isSelected: cellObj.isSelected)
        }
        
    }
    
    func handleSelectedCountryCode(isSelected:Bool){
        
        if isSelected {
           // countryNamelbl.textColor = UIColor.app_blue_Color
           // countryCodelbl.textColor = UIColor.app_dominant_blue_Color
        }
        else{
         //   countryNamelbl.textColor = UIColor.app_blue_Color
           // countryCodelbl.textColor = UIColor.app_green_Color
        }
    }
    
}

