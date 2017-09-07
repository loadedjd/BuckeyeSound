//
//  DeviceSelectionController.swift
//  SoundMap3
//
//  Created by Jared Williams on 9/4/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit

class DeviceSelectionController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var devicePicker: UIPickerView?
    private var deviceTextField: UITextField?
    private var devicesArray = ["iPhone 5", "iPhone 5s", "iPhone 6", "iPhone 6s", "iPhone 7"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupDevicePicker()
        self.setupView()
        self.setupConstraints()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupView() {
        self.view.backgroundColor = Colors.navigationWhite
        self.view.addSubview(self.devicePicker!)
    }
    
    func setupConstraints() {
        self.devicePicker?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.devicePicker?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    func setupDevicePicker() {
        self.devicePicker = UIPickerView()
        self.devicePicker?.delegate = self
        self.devicePicker?.dataSource = self
        
        self.devicePicker?.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setupNavigationBar() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
        self.navigationItem.rightBarButtonItem = doneButton
        self.navigationItem.title = "Device Settings"
    }
    
    func doneButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.devicesArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.devicesArray[row]
    }
    
    

}
