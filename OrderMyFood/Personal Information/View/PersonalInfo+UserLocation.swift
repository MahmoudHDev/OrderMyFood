//
//  PersonalInfo+UserLocation.swift
//  OrderMyFood
//
//  Created by Mahmoud on 7/9/22.
//

import UIKit
import CoreLocation

extension PersonalInfoViewController: CLLocationManagerDelegate {
    
    func coreLocationConfig() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        let coordinate = location.coordinate
        print("longitude \(coordinate.longitude), latitude \(coordinate.latitude)")
    }
    
}
