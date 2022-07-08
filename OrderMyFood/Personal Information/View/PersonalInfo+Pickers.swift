//
//  PersonalInfo+Pickers.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/8/22.
//

import UIKit


//MARK:- UIImagePicker

extension PersonalInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func configPickers() {
        imagePicker.delegate        = self
        imagePicker.allowsEditing   = true
        gender.delegate             = self
        gender.dataSource           = self
    }
    
    func pickAnImg() {
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            profilePhoto.image = image
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

//MARK:- UIPickerView

extension PersonalInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //MARK:- Data Source

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //MARK:- Delegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Gender is \(pickerData[row])")
    }
}


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
        self.view.endEditing(true)
    }
    
    @objc
    func cancelDatePicker(){
        self.view.endEditing(true)
    }

}

