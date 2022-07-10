//
//  First+TextField.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/9/22.
//

import UIKit

extension FirstViewController: UITextFieldDelegate {
    
    func textFieldConfig() {
        username.delegate   = self
        email.delegate      = self
        password.delegate   = self
    }
    
    func loginbtn() {
        signupOrInBtn.isEnabled       = true
        signupOrInBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1)
        signupOrInBtn.setTitleColor(.black, for: .normal)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if segmentControl.selectedSegmentIndex  == 0 {
            // SignUp
            if username.text != "" && email.text != "" && password.text != ""
            {
                loginbtn()
            }else{
                errorMssg.text = "Please fill all empty fields"
                errorMssg.textColor = .systemRed
                signupOrInBtn.isEnabled       = false
                signupOrInBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 0.5)
                
            }
        }else {
            // SignIn
            if email.text != "" && password.text != "" {
                loginbtn()
            }else{
                errorMssg.text = "Please fill all empty fields"
                errorMssg.textColor = .systemRed
                signupOrInBtn.isEnabled       = false
                signupOrInBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 0.5)
            }
        }
    }
    
}
