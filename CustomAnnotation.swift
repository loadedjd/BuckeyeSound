//
//  CustomAnnotation.swift
//  SoundMap3
//
//  Created by Jared Williams on 8/2/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var desc: String?
    
     init(coordinate: CLLocationCoordinate2D) {
        self.coordinate =  coordinate
    }
}
