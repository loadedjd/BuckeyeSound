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
        
        let mapNav = createNavigationController(color: Colors.navigationWhite, view: MapViewController(), tabTitle: "Map", navTitle: "Map")
        let image = UIImage(named: "location")
        mapNav.tabBarItem.image = image
       
        let settingsNav = createNavigationController(color: Colors.navigationWhite, view: SettingsController(), tabTitle: "Settings", navTitle: "Settings")
        settingsNav.tabBarItem.image = #imageLiteral(resourceName: "settingsLogo")
        
        
        viewControllers = [dataNav, mapNav, settingsNav]
        
    }
    
    func createNavigationController(color: UIColor, view: UIViewController, tabTitle: String, navTitle: String) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: view)
        nav.navigationBar.barTintColor = color
        
        nav.navigationBar.topItem?.title = navTitle
        nav.tabBarItem.title = tabTitle
        
        return nav
        
    }
    
 
    



}
