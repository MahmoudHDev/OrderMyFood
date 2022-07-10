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
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("getting user location")
        if let location  = locations.first {
            let coordinate      = location.coordinate
            print("longitude \(coordinate.longitude), latitude \(coordinate.latitude)")
        }else{
            print("Error While fetching the location")
        }
    }
    
}
