//
//  locationManager.swift
//  weatherdemo
//
//  Created by Md Zaid Ansari on 4/12/25.
//

import Foundation
import CoreLocation
class LocationManager: NSObject, ObservableObject , CLLocationManagerDelegate{
    let manager  = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isloading: Bool = false
    
    override  init () {
        super.init()
       manager.delegate = self
       // manager.desiredAccuracy = kCLLocationAccuracyBest
          //  manager.requestWhenInUseAuthorization()
          //  manager.startUpdatingLocation()
    }
    
    
      func requestLocation() {
        isloading = true
        manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        location = locations.first?.coordinate
        isloading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print("Error getting location" , error)
        isloading = false
    }
    
}

