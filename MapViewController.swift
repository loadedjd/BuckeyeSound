//
//  MapViewController.swift
//  SoundMap3
//
//  Created by Jared Williams on 7/30/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView?
    let locationManager: LocationManager = LocationManager()
    var addButton: UIBarButtonItem?
    var centerButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonPressed))
        self.centerButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.centerMap))
        
        setupView()
    }
    
    func setupView() {
        addNavigationButton(barButton: self.addButton!, side: .right)
        addNavigationButton(barButton: self.centerButton!, side: .left)
        setupMapView()
        centerMap()
    }
    
    func setupMapView() {
        
        self.mapView = MKMapView(frame: self.view.frame)
        self.view.addSubview(self.mapView!)
        self.locationManager.setMapCenter(longitude: -82.9988889 , latitude: 39.9611111 )
        self.mapView?.delegate = self
        
        
    }
    
    func setupConstraints() {
        self.mapView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.mapView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    func centerMap() {
        
        self.mapView?.setRegion(self.locationManager.getCenter(), animated: true)
    }
    
    func addNavigationButton(barButton: UIBarButtonItem, side: Sides) {
        if side == .left {
            self.navigationItem.leftBarButtonItem = barButton
        }
        
        if side == .right {
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    func addButtonPressed() {
        let nav = UINavigationController(rootViewController: RecordingController())
        self.present(nav, animated: true, completion: nil)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as! CustomAnnotationView
        
        return annotationView
    }



}
