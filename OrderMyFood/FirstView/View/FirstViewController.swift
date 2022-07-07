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
    
    var presenter: FirstPresenterView?
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FirstPresenterView(view: self)
        updateUI()
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
            if segmentControl.selectedSegmentIndex == 0 {
                // For Signup
                guard let name      = username.text,
                      let email     = email.text,
                      let password  = password.text else {
                    return
                }
                
                presenter?.signUp(username: name, email: email, password: password )
                print("SignUp")
                
                
            }else {
                // For login
                guard let email     = email.text,
                      let password  = password.text else {
                    return
                }
                presenter?.signIn(email: email, password: password)
                print("SignIn")
            }
            
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
 
    func updateUI() {
        let selected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let normal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        UISegmentedControl.appearance().setTitleTextAttributes(selected, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(normal, for: .normal)
    }
}

//MARK:- Presenter

extension FirstViewController: FirstPresenterProtocol {
    func signupSuccess() {
        print("sign In Succeded")
    }
    
    func signinSuccess() {
        print("sign In Succeded")
    }
    
    func faildReg() {
        print("signin or up  failed")
    }
    
    
}

