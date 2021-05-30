//
//  ViewController.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import UIKit

class ViewController: UIViewController {

    let feeds = [SMFeed(name: "twitter"), SMFeed(name: "facebook"), SMFeed(name: "instagram")]
    let settingsButton = UIButton()
    let settingsView = SettingsView()
    
    static let feedView = UIScrollView()
    
    let cover = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingsButton.layer.cornerRadius = 25
        self.settingsButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        self.settingsButton.setImage(UIImage(named: "cog"), for: .normal)
        
        self.cover.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        self.cover.isHidden = true
        self.cover.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).withAlphaComponent(0.2)
        
        self.view.addSubview(ViewController.feedView)
        self.view.addSubview(self.settingsButton)
        self.view.addSubview(self.cover)
        self.view.addSubview(self.settingsView)
        
        ViewController.feedView.showsVerticalScrollIndicator = false
        ViewController.feedView.showsHorizontalScrollIndicator = false
        
    }
    
    override func viewLayoutMarginsDidChange() {
        if let superview = self.view.superview?.superview{
            ViewController.feedView.frame = CGRect(x: 0, y: superview.layoutMargins.top+50, width: self.view.frame.width, height: self.view.frame.height-(superview.layoutMargins.top+superview.layoutMargins.bottom+50))
            self.settingsButton.frame = CGRect(x: self.view.frame.width-60, y: superview.layoutMargins.top, width: 50, height: 50)
        }
    }
    
    // Pulls down the settings and introduces a cover button to the screen which when clicked will remove the settings.
    
    @objc func showSettings(){
        self.settingsView.isShowing = !self.settingsView.isShowing
        self.settingsView.setVisibile(self.settingsView.isShowing)
        self.cover.isHidden = false
        UIView.animate(withDuration: 0.3) {
            if (self.settingsView.isShowing){
                self.cover.alpha = 1
            }
            else{
                self.cover.alpha = 0
            }
        }completion: { _ in
            self.cover.isHidden = !self.settingsView.isShowing
        }
    }


}

