//
//  FeedCell.swift
//  SoundMap3
//
//  Created by Jared Williams on 7/29/17.
//  Copyright © 2017 Jared Williams. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    
    private var decibelLabel: UILabel?
    private var timeLabel: UILabel?
    private var locationLabel: UILabel?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupUIElemenets()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        self.backgroundColor = UIColor.red
    
    }
    
    func setupUIElemenets() {
        
        self.decibelLabel = UILabel()
        self.decibelLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.decibelLabel?.textColor = UIColor.black
        self.decibelLabel?.font = UIFont.systemFont(ofSize: 30)
        self.addSubview(self.decibelLabel!)
        
        self.timeLabel = UILabel()
        self.timeLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.timeLabel?.textColor = UIColor.black
        self.timeLabel?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(self.timeLabel!)
        
        self.locationLabel = UILabel()
        self.locationLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.locationLabel?.textColor = UIColor.black
        self.locationLabel?.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(self.locationLabel!)
    }
    
    func setupConstraints() {
        
        self.decibelLabel?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.decibelLabel?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.timeLabel?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.timeLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.locationLabel?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.locationLabel?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    func setLocationLabel(text: String) {
        self.locationLabel?.text = text
    }
    
    func setTimeLabel(text: String) {
        self.timeLabel?.text = text
    }
    
    func setDecibel(text: String) {
        self.decibelLabel?.text = "\(text) DB"
    }
    
    
    
    
    
    
}
