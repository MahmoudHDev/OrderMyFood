//
//  ViewController.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/2/22.
//

import UIKit

class FirstViewController: UIViewController {
    //MARK:- Properties
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var username     : UITextField!
    @IBOutlet weak var email        : UITextField!
    @IBOutlet weak var password     : UITextField!
    @IBOutlet weak var signupOrInBtn: UIButton!
    @IBOutlet weak var forgetPassBtn: UIButton!
    @IBOutlet weak var loginFace    : UIButton!
    @IBOutlet weak var loginGoog    : UIButton!

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK:- Actions

    @IBAction func segmented(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            signupOrInBtn.setTitle("Signup", for: .normal)
            email.placeholder       = "Email"
            username.isHidden       = false
            forgetPassBtn.isHidden  = true
            
        }else{
            signupOrInBtn.setTitle("Login", for: .normal)
            email.placeholder      = "Username or Email"
            forgetPassBtn.isHidden = false
            username.isHidden      = true
        }
    }
    
    
    @IBAction func firstBtn(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("signup or login")
        case 1:
            print("Forget your Password")
        case 2:
            print("Login by Google")
        case 3:
            print("Login by Facebook")
        default:
               print("No buttons")
        }
    }
    
}

