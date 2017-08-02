//
//  CustomTabBarController.swift
//  SoundMap3
//
//  Created by Jared Williams on 7/29/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        
        let dataView = DataCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let dataNav = createNavigationController(color: Colors.navigationWhite, view: dataView, tabTitle: "Records", navTitle: "Records")
        
        //let recordingNav = createNavigationController(color: Colors.navigationWhite, view: RecordingController(), tabTitle: "New Record", navTitle: "New Record")
        
        let mapNav = createNavigationController(color: Colors.navigationWhite, view: MapViewController(), tabTitle: "Map", navTitle: "Map")
        
        
        
        viewControllers = [dataNav, mapNav]
        
    }
    
    func createNavigationController(color: UIColor, view: UIViewController, tabTitle: String, navTitle: String) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: view)
        nav.navigationBar.barTintColor = color
        
        nav.navigationBar.topItem?.title = navTitle
        nav.tabBarItem.title = tabTitle
        
        return nav
        
    }
    
 
    



}
