//
//  PersonalInfoViewController.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/7/22.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var profilePhoto : UIImageView!
    @IBOutlet weak var gender       : UIPickerView!
    @IBOutlet weak var fName        : UITextField!
    @IBOutlet weak var lName        : UITextField!
    @IBOutlet weak var dateOB       : UITextField!
    var presenter                   : PersonalInfoView?
    let imagePicker                 = UIImagePickerController()
    let datePicker                  = UIDatePicker()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PersonalInfoView(view: self)
        showDatePicker()
    }

    //MARK:- Action

    func showDatePicker() {
        // Formate Date
        datePicker.datePickerMode = .date
        
        // ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

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

extension PersonalInfoViewController: PersonalInfoProtocol {
    func dataSaved() {
        print("Data Saved")
    }
    
    
}
