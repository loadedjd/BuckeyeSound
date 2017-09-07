//
//  NewDataControllerCollectionViewController.swift
//  SoundMap3
//
//  Created by Jared Williams on 7/29/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class DataCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var addButton: UIBarButtonItem?
    var firebaseManager: FirebaseManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseManager.getData()
        
        self.addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addButtonPressed))
        setupView()
        setupNotifications()
        
        self.collectionView!.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
    func setupView() {
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.alwaysBounceVertical = true
        
        addNavigationButton(barButton: self.addButton!, side: .right)
        
        self.navigationController?.tabBarItem.image = #imageLiteral(resourceName: "recordsSymbol5")
        
    }
    
    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadData), name: NSNotification.Name(rawValue: "reloadData"), object: nil)
    }
    
    func reloadData() {
        self.collectionView?.reloadData()
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

    
  

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        let count = FirebaseManager.getCount()
        
        return count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return setupCell(row: indexPath.row, index: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    func setupCell(row: Int, index: IndexPath) -> FeedCell {
        let cell = collectionView?.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: index) as! FeedCell
        let entry = FirebaseManager.getEntry(entry: row) 
        
        print("\(entry) yayayay" )
        
        cell.setDecibel(text: entry["Decibels"]!)
        cell.setTimeLabel(text: entry["time"]!)
        cell.setLocationLabel(text: entry["Location"]!)
        
        
        let decibel = Double(entry["Decibels"]!)!
        
        if (decibel < 60.0) {
            cell.backgroundColor = UIColor.green
        }
        
        if (decibel >= 60.0 && decibel < 80.0) {
            cell.backgroundColor = UIColor.yellow
        }
        
        if (decibel >= 80) {
            cell.backgroundColor = UIColor.red
        }
        
        
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
