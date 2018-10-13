//
//  StartRunVC.swift
//  RunTracer
//
//  Created by Harshit Satyaseel on 22/09/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit
import MapKit


class StartRunVC: locationVC {

    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationAuthStatus()
        mapView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        manager?.delegate = self
        manager?.startUpdatingLocation()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        manager?.stopUpdatingLocation()
    }
    
    


    @IBAction func centreLocationButton(_ sender: Any) {
    }
    

}

// we need to extend the class for show the user its location on the map so..

extension StartRunVC : CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse{
            checkLocationAuthStatus()
            mapView.showsUserLocation = true
            mapView.userTrackingMode = .follow
        }
        
    }
    
}
