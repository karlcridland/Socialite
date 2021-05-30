//
//  ViewController.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import UIKit

class ViewController: UIViewController {

    let feeds = [SMFeed(name: "twitter"), SMFeed(name: "facebook"), SMFeed(name: "instagram")]
    let feedView = UIScrollView()
    let settingsButton = UIButton()
    let settingsView = SettingsView()
    
    let cover = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.settingsButton.layer.cornerRadius = 30
        self.settingsButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        self.settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        self.settingsButton.setImage(UIImage(named: "cog"), for: .normal)
        
        self.cover.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        
        self.view.addSubview(self.feedView)
        self.view.addSubview(self.settingsButton)
        self.view.addSubview(self.cover)
        self.view.addSubview(self.settingsView)
    }
    
    override func viewLayoutMarginsDidChange() {
        if let superview = self.view.superview?.superview{
            self.feedView.frame = CGRect(x: 0, y: superview.layoutMargins.top, width: self.view.frame.width, height: self.view.frame.height-(superview.layoutMargins.top+superview.layoutMargins.bottom))
            self.settingsButton.frame = CGRect(x: self.view.frame.width-80, y: superview.layoutMargins.top+20, width: 60, height: 60)
        }
    }
    
    @objc func showSettings(){
        self.settingsView.isShowing = !self.settingsView.isShowing
        self.settingsView.setVisibile(self.settingsView.isShowing)
        
        UIView.animate(withDuration: 0.3) {
            if (self.settingsView.isShowing){
                self.cover.alpha = 1
            }
            else{
                self.cover.alpha = 0
            }
        }
    }


}

