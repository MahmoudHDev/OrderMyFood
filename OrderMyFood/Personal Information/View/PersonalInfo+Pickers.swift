//
//  PersonalInfo+Pickers.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/8/22.
//

import UIKit

//MARK:- DatePicker

extension PersonalInfoViewController {
    
    func showDatePicker() {
        // Formate Date
        datePicker.datePickerMode = .date
        
        // ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton      = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton     = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton    = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        dateOB.inputAccessoryView = toolbar
        dateOB.inputView          = datePicker
    }
    
    @objc
    func donedatePicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateOB.text = formatter.string(from: datePicker.date)
        dateOB.placeholder = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc
    func cancelDatePicker(){
        self.view.endEditing(true)
    }

}
