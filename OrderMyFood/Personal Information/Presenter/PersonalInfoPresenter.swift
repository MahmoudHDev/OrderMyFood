//
//  PersonalInfoPresenter.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/7/22.
//

import Foundation

protocol PersonalInfoProtocol{
    func dataSaved()
}

//MARK:- Presenter

class PersonalInfoView {
    //MARK:- Properties
    var view: PersonalInfoProtocol?
    
    //MARK:- Init
    init(view:PersonalInfoProtocol ) {
        self.view = view
    }
    
    //MARK:- Action

    // Save the data from the viewController

}
