//
//  OTPScreen.swift
//  MentorzSignUpAndLoginFlow
//
//  Created by Sachin Anand on 04/04/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class OTPScreen: UIViewController {

    @IBOutlet weak var firstTxtField: UITextField!
    @IBOutlet weak var secondTxtField: UITextField!
    @IBOutlet weak var thirdTxtField: UITextField!
    @IBOutlet weak var fourthTxtField: UITextField!
    @IBOutlet weak var fifthTxtField: UITextField!
    @IBOutlet weak var sixthTxtField: UITextField!
    @IBOutlet weak var verifyOTPbutton: MentorzButton!
    var firebase : FireBaseManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func verifyButtonPressed(_ sender: MentorzButton) {
    }
    //MARK:- IBOutlet Properties
    
   
    @IBAction func textEditDidBegin(_ sender: UITextField) {
        print("textEditDidBegin has been pressed")
        
        if !(sender.text?.isEmpty)!{
            sender.selectAll(self)
            //buttonUnSelected()
        }else{
            print("Empty")
            sender.text = " "
            
        }
        
    }
    @IBAction func textEditChanged(_ sender: UITextField) {
        print("textEditChanged has been pressed")
        let count = sender.text?.count
        //
        if count == 1{
            
            switch sender {
            case firstTxtField:
                secondTxtField.becomeFirstResponder()
            case secondTxtField:
                thirdTxtField.becomeFirstResponder()
            case thirdTxtField:
                fourthTxtField.becomeFirstResponder()
            case fourthTxtField:
                fifthTxtField.becomeFirstResponder()
            case fifthTxtField:
                sixthTxtField.becomeFirstResponder()
            case sixthTxtField:
                sixthTxtField.resignFirstResponder()
            default:
                print("Default case")
            }
        }
        
    }
    
    
   
    
    //MARK:- Custom Action
    func setUpView(){
        
        
        firstTxtField.delegate = self
        secondTxtField.delegate = self
        thirdTxtField.delegate = self
        fourthTxtField.delegate = self
        fifthTxtField.delegate = self
        sixthTxtField.delegate = self
        firstTxtField.becomeFirstResponder()
        
        buttonUnSelected()
    }
    
    func buttonUnSelected(){
       
        verifyOTPbutton.isUserInteractionEnabled = false
    }
    func checkAllFilled(){
        
        if (firstTxtField.text?.isEmpty)! || (secondTxtField.text?.isEmpty)! || (thirdTxtField.text?.isEmpty)! || (fourthTxtField.text?.isEmpty)! || (fifthTxtField.text?.isEmpty)! || (sixthTxtField.text?.isEmpty)!{
            buttonUnSelected()
        }else{
            buttonSelected()
        }
    }
    
    func buttonSelected(){
        
        verifyOTPbutton.isUserInteractionEnabled = true
    }
    
}





extension OTPScreen : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = ""
        if textField.text == "" {
            print("Backspace has been pressed")
        }
        
        if string == ""
        {
            print("Backspace was pressed")
            switch textField {
            case secondTxtField:
                firstTxtField.becomeFirstResponder()
            case thirdTxtField:
                secondTxtField.becomeFirstResponder()
            case fourthTxtField:
                thirdTxtField.becomeFirstResponder()
            case fifthTxtField:
                fourthTxtField.becomeFirstResponder()
            case sixthTxtField:
                fifthTxtField.becomeFirstResponder()
            default:
                print("default")
            }
            textField.text = ""
            return false
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkAllFilled()
    }
    
    


    

}
