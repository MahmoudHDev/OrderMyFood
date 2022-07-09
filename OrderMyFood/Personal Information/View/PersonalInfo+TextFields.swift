//
//  PersonalInfo+TextFields.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/8/22.
//

import UIKit

extension PersonalInfoViewController: UITextFieldDelegate {
    
    func textFieldConfig() {
        fName.delegate  = self
        lName.delegate  = self
        dateOB.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if dateOB.text != "" && fName.text != "" && lName.text != ""{
            continueBtn.isEnabled       = true
            continueBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7323547006, blue: 0.947804749, alpha: 1)
        }else{
            errorLabel.text = "Please fill all empty fields"
            errorLabel.textColor = .systemRed
            continueBtn.isEnabled       = false
            continueBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7323547006, blue: 0.947804749, alpha: 0.5)
        }
    }
    
}
