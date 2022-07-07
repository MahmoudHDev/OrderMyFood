//
//  FirstPresenter.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/7/22.
//

import Foundation
import Firebase

protocol FirstPresenterProtocol {
    func signupSuccess()
    func signinSuccess()
    func faildReg()

}


class FirstPresenterView {
    //MARK:- Properties
    var view: FirstPresenterProtocol?
    
    //MARK:- Init
    init(view: FirstPresenterProtocol) {
        self.view = view
    }
    
    //MARK:- Methods
    
    // SignUp Firebase
    func signUp(username: String, email:String, password: String) {
        print("SignUp Btn")
    }
    
    
    // Signin Firebase
    func signIn(email:String, password: String) {
        print("signIn Btn")
    }

}
