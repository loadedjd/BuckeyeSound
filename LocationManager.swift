//
//  Location.swift
//  SoundMap3
//
//  Created by Jared Williams on 7/31/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject,CLLocationManagerDelegate {
    
    
    private var locationManager: CLLocationManager?
    private var centerLocation: MKCoordinateRegion?
    private var authStatus: CLAuthorizationStatus?
    private var currentLocation: CLLocation?
    public static var sharedInstace = LocationManager()
    
    override init() {
        super.init()
        
        self.locationManager = CLLocationManager()
        self.requestAuth(manager: self.locationManager!)
        
        
    }
    
    func requestAuth(manager: CLLocationManager)  {
        manager.requestWhenInUseAuthorization()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authStatus = status
        
        if self.authStatus == CLAuthorizationStatus.authorizedWhenInUse {
            setupLocationManager()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.last!
    }
    
    func setupLocationManager() {
        
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager?.delegate = self
        self.locationManager?.startUpdatingLocation()
    }
    
    func makeRegion(center: CLLocationCoordinate2D) -> MKCoordinateRegion{
        
        let region = MKCoordinateRegionMakeWithDistance(center, 30000, 30000)
        
        return region
    }
    
    func setMapCenter(longitude: Double, latitude: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.centerLocation = makeRegion(center: coordinate)
    }
    
    func getCenter() -> MKCoordinateRegion {
        return self.centerLocation!
    }
    
    
    
}
