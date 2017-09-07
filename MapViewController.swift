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
    var addButton: UIBarButtonItem?
    var centerButton: UIBarButtonItem?
    var centerLocation: MKCoordinateRegion?
    var firebaseManager: FirebaseManager?
    var addedAnnotation: [MKPointAnnotation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonPressed))
        self.centerButton = UIBarButtonItem(image: #imageLiteral(resourceName: "centerButton"), style: .plain, target: self, action: #selector(self.centerMap))
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.addAnnotations), name: NSNotification.Name(rawValue: "reloadMap"), object: nil)
        setupView()
        self.addAnnotations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.addAnnotations()
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
        self.setMapCenter(longitude: -82.9988889 , latitude: 39.9611111 )
        self.mapView?.showsUserLocation = true
        self.mapView?.delegate = self
        
        
    }
    
    func setupConstraints() {
        self.mapView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.mapView?.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    func centerMap() {
        
        self.mapView?.setRegion(self.centerLocation!, animated: true)
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
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let reuseId = "pin"
//        
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
//        
//        if annotationView == nil {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            annotationView?.canShowCallout = true
//        }
//        
//        else {
//            annotationView?.annotation = annotation
//        }
//        
//        return annotationView
//    }
    
    func makeRegion(center: CLLocationCoordinate2D) -> MKCoordinateRegion{
        
        let region = MKCoordinateRegionMakeWithDistance(center, 30000, 30000)
        
        return region
    }
    
    func setMapCenter(longitude: Double, latitude: Double) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.centerLocation = makeRegion(center: coordinate)
    }
    
    
    func addAnnotations() {
        
        let entries = FirebaseManager.getAllData()
        print("\(entries) wiley cyote")
        
      
        
        
            let annotations = self.addedAnnotation
            self.mapView?.removeAnnotations(annotations)
           // print("removed")
        
        
        
        
        
        
        
        
        
        
        for entry in entries {
            let lat = CLLocationDegrees( entry["Lat"]!)
            let long = CLLocationDegrees( entry["Long"]!)
            
            
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(lat!, long!)
            annotation.title = "\(entry["Decibels"]!) DB"
            self.addedAnnotation.append(annotation)
            
            self.mapView?.addAnnotation(annotation)
        }
    }



}
