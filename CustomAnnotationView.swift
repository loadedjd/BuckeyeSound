//
//  CustomAnnotationView.swift
//  SoundMap3
//
//  Created by Jared Williams on 8/1/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit
import MapKit

class CustomAnnotationView: MKAnnotationView {
    
    
    

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.canShowCallout = true
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
