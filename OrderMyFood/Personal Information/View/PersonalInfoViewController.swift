//
//  PersonalInfoViewController.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/7/22.
// User will get this viewController once he signed up for the first time

import UIKit



class PersonalInfoViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var profilePhoto : UIImageView!
    @IBOutlet weak var changeImgBtn : UIButton!
    @IBOutlet weak var fName        : UITextField!
    @IBOutlet weak var lName        : UITextField!
    @IBOutlet weak var gender       : UIPickerView!
    @IBOutlet weak var dateOB       : UITextField!
    @IBOutlet weak var continueBtn  : UIButton!
    
    var presenter                   : PersonalInfoView?
    let imagePicker                 = UIImagePickerController()
    let datePicker                  = UIDatePicker()
    
    var pickerData: [String] = ["Male", "Female", "Prefer not to select"]
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PersonalInfoView(view: self)
        updateUI()
        showDatePicker()
        configPickers()
        textFieldConfig()
    }

    //MARK:- Action
    @IBAction func buttonsView(_ sender: UIButton){
        // tag 0 => image picker
        if sender.tag == 0 {
            pickAnImg()
        }else{
//            boxesFilled()
            
        }
    }
    
    //MARK:- Functions
    
    func updateUI(){
        profilePhoto.layer.cornerRadius = 0.5 * profilePhoto.bounds.width
        changeImgBtn.layer.cornerRadius = 0.5 * changeImgBtn.bounds.width
        continueBtn.layer.cornerRadius = 15
    }
    
}

//MARK:- Presenter
extension PersonalInfoViewController: PersonalInfoProtocol {
    
    func dataSaved() {
        print("Data Saved")
    }
    
}
