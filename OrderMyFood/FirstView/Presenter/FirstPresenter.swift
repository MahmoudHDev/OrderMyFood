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
    func signUpError(error:String)
    
}
//MARK:- Presenter

class FirstPresenterView {
    //MARK:- Properties
    var view: FirstPresenterProtocol?
    let ref = Firestore.firestore()
    
    //MARK:- Init
    init(view: FirstPresenterProtocol) {
        self.view = view
    }
    
    //MARK:- Methods
    
    //MARK:- Handle Signup
    
    func signUp(username: String, email:String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let er = error as NSError? {
                switch AuthErrorCode.Code(rawValue: er.code) {
                case .weakPassword:
                    print("Weak Password!")
                    self.view?.signUpError(error: "Weak Password!")
                case .userDisabled:
                    print("the user account has been disabled")
                    self.view?.signUpError(error: "the user account has been disabled")
                case .wrongPassword:
                    print("The passwrod is invalid")
                    self.view?.signUpError(error: "The passwrod is invalid")
                case .invalidEmail:
                    print("the email is malformed")
                    self.view?.signUpError(error: "the email is malformed")
                case .emailAlreadyInUse:
                    print("Email Is Already in use")
                    self.view?.signUpError(error: "Email Is Already in use")
                default:
                    print(" the localized Error --> \(er.localizedDescription)")
                    self.view?.signUpError(error: "Error! \(er.localizedDescription)")
                }
            }else{
                guard let user = Auth.auth().currentUser else {return}
                let values:[String: Any] = [
                    K.FStoreUser.username      : username,
                    K.FStoreUser.email         : email,
                    K.FStoreUser.password      : password,
                    K.FStoreUser.dateJoined    : Timestamp(),
                    K.FStoreUser.userId        : user.uid
                ]
                
                let document = self.ref.collection(K.FStoreCollections.users).document(user.uid)
                document.setData(values)
                print("Successfully sent to the Realtime DB")
            }
        }
    }
    
    //MARK:- Handle Signin
    
    func signIn(email:String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let er = error as NSError? {
                switch AuthErrorCode.Code(rawValue: er.code) {
                case .operationNotAllowed:
                    self.view?.signUpError(error: "Emails and accounts are not enabled")
                case .userDisabled:
                    self.view?.signUpError(error: "the user account has been disabled" )
                case .wrongPassword:
                    self.view?.signUpError(error: "The passwrod is invalid")
                case .invalidEmail:
                    self.view?.signUpError(error: "the email is malformed")
                default:
                    self.view?.signUpError(error:er.localizedDescription)
                }
            }else{
                // Array that contains the user
                guard let userInformation = authResult!.user.email else { return }
                print("Login successfullu as \(userInformation)")
                self.view?.signinSuccess()
            }
        }
    }
    
}
