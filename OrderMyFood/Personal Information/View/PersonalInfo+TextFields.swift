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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if dateOB.text != "" && fName.text != "" && lName.text != "" {
            continueBtn.isEnabled       = true
            continueBtn.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.8039215686, blue: 0.2549019608, alpha: 1)
            continueBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)

        }else{
            errorLabel.text = "Please fill all empty fields"
            errorLabel.textColor        = .systemRed
            continueBtn.isEnabled       = false
            continueBtn.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.8039215686, blue: 0.2549019608, alpha: 0.5)
            continueBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5), for: .normal)
        }
    }
}
