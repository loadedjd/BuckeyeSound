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
    var audioController: AudioManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
        
        setupView()
        setupModelElements()

    }
    
    func setupModelElements() {
        self.audioController = AudioManager()
        
    }
    
    
    func setupView() {
        self.view.backgroundColor = Colors.navigationWhite
        addNavigationButton(barButton: self.doneButton!, side: .right)
        
        self.navigationItem.title = "New Record"
        
        self.setupUIElements()
        
        self.view.addSubview(self.dbLabel!)
        self.view.addSubview(self.latLabel!)
        self.view.addSubview(self.longLabel!)
        self.view.addSubview(self.recordButton!)
        
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
        
        self.recordButton = UIButton()
        self.recordButton?.addTarget(self, action: #selector(self.recordButtonPressed), for: .touchUpInside)
        self.recordButton?.setTitle("Record", for: .normal)
        self.recordButton?.translatesAutoresizingMaskIntoConstraints = false
        self.recordButton?.setBackgroundImage(#imageLiteral(resourceName: "Rectangle"), for: .normal)
        
        
        
        
        
    }
    
    func setupConstraints() {
        self.dbLabel?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.dbLabel?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.latLabel?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
        self.latLabel?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
        
        self.longLabel?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
        self.longLabel?.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8).isActive = true
        
        self.recordButton?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.recordButton?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
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
    
    func recordButtonPressed() {
        self.audioController?.startRecording()
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateMeters), name: NSNotification.Name(rawValue: "updateAudio"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.doneRecording), name: NSNotification.Name(rawValue: "recordingDone"), object: nil)

        self.doneButton?.isEnabled = false
    }
    
    func updateMeters() {
        guard let sample = self.audioController?.samples.last! else { return }
        var color = UIColor.black
        
        if (sample + 100 < 60) {
            color = UIColor.green
        }
        
        if (sample + 100 >= 60 && sample < 80) {
            color = UIColor.yellow
        }
        
        if (sample + 100 > 80) {
            color = UIColor.red
        }
        
       
        
        self.dbLabel?.textColor = color
        self.dbLabel?.text = "\(sample + 100) DB"
    }
    
    func doneRecording() {
        self.dismiss(animated: true, completion: nil)
        self.doneButton?.isEnabled = true
        
        
        let currentRecord = createRecord()
        FirebaseManager.postData(record: currentRecord)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadMap"), object: nil)

        
    }
    
    func createRecord() -> Record{
        let lat = Double((LocationManager.sharedInstance.currentLocation?.coordinate.latitude)!)
        let long = Double((LocationManager.sharedInstance.currentLocation?.coordinate.longitude)!)
        
        
        timeDate.updateDate() // Update time
        let record = Record(decibel: (self.audioController?.logAverage)!, ilatitude: Float(lat), ilongitude: Float(long), itime: timeDate.timeStamp)
        
        return record
    }





}
