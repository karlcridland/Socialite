//
//  SettingsView.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import Foundation
import UIKit

class SettingsView: UIView {
    
    var isShowing = false
    
    private let slider = UISlider(frame: CGRect(x: 20, y: 160, width: UIScreen.main.bounds.width-40, height: 20))
    private let title = UILabel(frame: CGRect(x: 20, y: 80, width: UIScreen.main.bounds.width-40, height: 50))
    private let distance = UILabel(frame: CGRect(x: 20, y: 80, width: UIScreen.main.bounds.width-40, height: 50))
    
    override init(frame: CGRect) {
        super .init(frame: CGRect(x: 0, y: -200, width: UIScreen.main.bounds.width, height: 200))
        
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.addSubview(title)
        self.title.text = "refresh rate:"
        self.title.font = .systemFont(ofSize: 22, weight: UIFont.Weight(0.4))
        
        self.addSubview(self.distance)
        self.distance.text = "5 secs"
        self.distance.textAlignment = .right
        self.distance.font = .systemFont(ofSize: 22, weight: UIFont.Weight(0.4))
        
        self.addSubview(self.slider)
        self.slider.minimumValue = 1
        self.slider.maximumValue = 60
        self.slider.value = 5
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        
        self.slider.addTarget(self, action: #selector(didSlide), for: .valueChanged)
        
    }
    
    // Updates the time taken between updates when the user slides the UISlider.
    
    @objc func didSlide(_ sender: UISlider){
        SMFeed.interval = TimeInterval(Int(sender.value))
        self.distance.text = "\(Int(sender.value)) secs"
    }
    
    // Pulls the settings view menu down into view or up out of view.
    
    func setVisibile(_ visible: Bool) {
        UIView.animate(withDuration: 0.3) {
            if (visible){
                self.transform = CGAffineTransform(translationX: 0, y: 200)
            }
            else{
                self.transform = CGAffineTransform.identity
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
