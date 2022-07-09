//
//  PersonalInfoPresenter.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/7/22.
//

import Foundation
import Firebase

//MARK:- Protocol

protocol PersonalInfoProtocol{
    func errorOccured(er: String)
    
    func dataSaved()
}

//MARK:- Presenter
class PersonalInfoView {
    
    //MARK:- Properties
    var view: PersonalInfoProtocol?
    var ref = Firestore.firestore()
    var storage = Storage.storage().reference()
    //MARK:- Init
    init(view:PersonalInfoProtocol ) {
        self.view = view
    }
    
    //MARK:- Action

    // Save the data from the viewController
    func savePersonalInfo(fName:String, lName:String, gender: String, dOB:String) {
        guard let user = Auth.auth().currentUser else { return }
        let docunmentData: [String: Any] = [
            K.PersonalInfo.fName    : fName,
            K.PersonalInfo.lName    : lName,
            K.PersonalInfo.gender   : gender,
            K.PersonalInfo.dateOB   : dOB
        ]
        
        let document = ref.collection(K.FStoreCollections.users).document(user.uid)
        document.setData(docunmentData) { (err) in
            if let er = err  {
                self.view?.errorOccured(er: er.localizedDescription)
            }else{
                self.view?.dataSaved()
            }
        }
        
    }
    
    
}
