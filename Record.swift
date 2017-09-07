//
//  Record.swift
//  SoundMap3
//
//  Created by Jared Williams on 8/7/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import Foundation
import MapKit

class Record {
    
    var decibel: String
    var latittude: String
    var longitude: String
    var timeStamp: String
    var location: String
    
    init (decibel: Float, ilatitude: Float, ilongitude: Float, itime: String)  {
        self.decibel = String(decibel).truncate(length: 5)
        self.latittude = String(ilatitude)
        self.longitude = String(ilongitude)
        self.timeStamp = itime
        
        self.location = "\(String(ilatitude).truncate(length: 5)) N  \(String(ilongitude).truncate(length: 5)) W"
    }
    
    
}
