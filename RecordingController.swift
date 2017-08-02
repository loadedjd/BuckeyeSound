//
//  RecordingController.swift
//  SoundMap3
//
//  Created by Jared Williams on 7/30/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit

class RecordingController: UIViewController {
    
    var doneButton: UIBarButtonItem?
    var dbLabel: UILabel?
    var latLabel: UILabel?
    var longLabel: UILabel?
    var recordButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
        
        setupView()

    }
    
    
    func setupView() {
        self.view.backgroundColor = Colors.navigationWhite
        addNavigationButton(barButton: self.doneButton!, side: .right)
        
        self.navigationItem.title = "New Record"
        
        self.setupUIElements()
        
        self.view.addSubview(self.dbLabel!)
        self.view.addSubview(self.latLabel!)
        self.view.addSubview(self.longLabel!)
        
        self.setupConstraints()
    }
    
    func setupUIElements() {
        
        self.dbLabel = UILabel()
        self.dbLabel?.translatesAutoresizingMaskIntoConstraints = false
        dbLabel?.text = "0.0 DB"
        dbLabel?.font = UIFont.systemFont(ofSize: 40, weight: 1)
        dbLabel?.textColor = Colors.textBlack
        
        self.latLabel = UILabel()
        self.latLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.latLabel?.text = "lat"
        
        
        self.longLabel = UILabel()
        self.longLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.longLabel?.text = "long"
        
        
    }
    
    func setupConstraints() {
        self.dbLabel?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.dbLabel?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
//        self.latLabel?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
//        self.latLabel?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
//        
//        self.longLabel?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
//        self.longLabel?.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8).isActive = true
        
    }
    
    func addNavigationButton(barButton: UIBarButtonItem, side: Sides) {
        if side == .left {
            self.navigationItem.leftBarButtonItem = barButton
        }
        
        if side == .right {
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    func doneButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }





}
