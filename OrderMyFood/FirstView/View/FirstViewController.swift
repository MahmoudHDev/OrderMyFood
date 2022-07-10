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
    @IBOutlet weak var errorMssg    : UILabel!
    var presenter: FirstPresenterView?
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = FirstPresenterView(view: self)
        updateUI()
        textFieldConfig()
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
                      let password  = password.text else {return}
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
            signupOrInBtn.isEnabled       = false
            signupOrInBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 0.5)
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
        let selected = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let normal = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        view.addGestureRecognizer(tapGesture)
        UISegmentedControl.appearance().setTitleTextAttributes(selected, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(normal, for: .normal)
        
        signupOrInBtn.isEnabled = false
        signupOrInBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 0.3983572346)
        signupOrInBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5), for: .normal)

        
    }
    
}

//MARK:- Presenter
extension FirstViewController: FirstPresenterProtocol {
    
    func signupSuccess() {
        // Show the UserInformationViewController
        print("signup Succeded")
        
        let storyBoard = UIStoryboard.init(name: "PersonalInfo", bundle: nil).instantiateViewController(identifier: "showInfoView")
        self.dismiss(animated: true, completion: nil)
        self.present(storyBoard, animated: true)
    }
    
    func signinSuccess() {
        //Show the HomeViewController
        signupOrInBtn.isEnabled       = false
        signupOrInBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 0.5)
        print("sign In Succeded")
    }
    
    func signUpError(error:String) {
        // show in error Label
        errorMssg.isHidden = false
        errorMssg.text = error
        signupOrInBtn.isEnabled       = true
        signupOrInBtn.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1)
    }    
}

