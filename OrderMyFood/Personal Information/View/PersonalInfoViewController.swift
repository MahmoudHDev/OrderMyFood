//
//  PersonalInfoViewController.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/7/22.
// User will get this viewController once he signed up for the first time

import UIKit
import CoreLocation
import GoogleMaps

class PersonalInfoViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var profilePhoto : UIImageView!
    @IBOutlet weak var fName        : UITextField!
    @IBOutlet weak var lName        : UITextField!
    @IBOutlet weak var dateOB       : UITextField!
    @IBOutlet weak var continueBtn  : UIButton!
    @IBOutlet weak var errorLabel   : UILabel!
    @IBOutlet weak var segmentedCont: UISegmentedControl!
    
    var presenter                   : PersonalInfoView?
    
    let imagePicker                 = UIImagePickerController()
    let datePicker                  = UIDatePicker()
    let locationManager             = CLLocationManager()
    let ceo                         = CLGeocoder()
    let marker                      = GMSMarker()
        
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PersonalInfoView(view: self)
        
        updateUI()
        showDatePicker()
        textFieldConfig()
        coreLocationConfig()
    }

    //MARK:- Action
    @IBAction func buttonsView(_ sender: UIButton){
        var gender = "Male"
        if segmentedCont.selectedSegmentIndex == 0 {
            // male
            gender = "Male"
        }else{
            // female
            gender = "Female"
        }
        
        presenter?.savePersonalInfo(fName: fName.text!, lName: lName.text!, gender: gender, dOB: dateOB.text!)
            
    }
    //MARK:- Functions
    
    func updateUI(){
        continueBtn .isEnabled          = false
        profilePhoto.layer.cornerRadius = 0.5 * profilePhoto.bounds.width
        profilePhoto.layer.borderWidth  = 1
        profilePhoto.layer.borderColor  = CGColor(red: 255, green: 159, blue: 41, alpha: 1)
        continueBtn .layer.cornerRadius = 15
        
    }
    
}
//MARK:- Presenter
extension PersonalInfoViewController: PersonalInfoProtocol {
    
    func dataSaved() {
        print("Data Saved")
        // Go to next ViewController
    }
    func errorOccured(er: String){
    print("error \(er)")
    }

}
