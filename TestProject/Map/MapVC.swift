//
//  MapVC.swift
//  TestProject
//
//  Created by Илья Разгильдеев on 16/05/2019.
//  Copyright © 2019 Илья Разгильдеев. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController, GMSMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    var mapView:GMSMapView?
    
    override func viewDidLoad() {
        
        GMSServices.provideAPIKey("AIzaSyDehe8iNtN0cZQhaPuM9YMqS0Ji2gGesrU")
        super.viewDidLoad()
        mapView = GMSMapView()
        mapView!.frame = self.view.frame
        mapView?.isMyLocationEnabled = true
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        mapView?.delegate = self
        view.addSubview(mapView!)

    }

}

extension MapVC: CLLocationManagerDelegate {
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .authorizedWhenInUse {

            // 4
            locationManager.startUpdatingLocation()

            //5
            mapView!.isMyLocationEnabled = true
            mapView!.settings.myLocationButton = true
        }
    }

    // 6
    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {

            // 7
            let camera =  GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 10)
           self.mapView?.animate(to: camera)
            // 8
            locationManager.stopUpdatingLocation()
        }

    }
}
