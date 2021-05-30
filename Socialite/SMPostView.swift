//
//  SMPostView.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import Foundation
import UIKit

class SMPostView: UIView {
    
    let username: UIButton
    let body: UITextView
    let icon: UIImageView
    let post: SMPost
    
    init(frame: CGRect, post: SMPost) {
        self.username = UIButton(frame: CGRect(x: 35, y: 8, width: frame.width-60, height: 20))
        self.body = UITextView(frame: CGRect(x: 5, y: 30, width: frame.width-10, height: frame.height-40))
        self.icon = UIImageView(frame: CGRect(x: 10, y: 7, width: 20, height: 20))
        self.post = post
        super .init(frame: frame)
        
        self.username.setTitle(post.user, for: .normal)
        self.username.titleLabel!.font = .systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 0.3))
        self.username.contentHorizontalAlignment = .left
        self.username.setTitleColor(.black, for: .normal)
        
        self.body.text = post.message
        self.icon.image = UIImage(named: post.platform.rawValue)
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.cornerRadius = 5
        self.backgroundColor = .white
        
        [self.username,self.body,self.icon].forEach { view in
            self.addSubview(view)
        }
        
        switch post.platform{
        case .twitter:
            self.username.addTarget(self, action: #selector(openTwitter), for: .touchUpInside)
        default:
            break
        }
    }
    
    // If a user has twitter downloaded on their phone then it will open the users account in app, alternatively the page will be opened within a broswer.
    
    @objc func openTwitter(){
        
        let appURL = URL(string: "twitter://user?screen_name=\(self.post.user)")!
        let webURL = URL(string: "https://twitter.com/\(self.post.user)")!

        if UIApplication.shared.canOpenURL(appURL as URL) {
            UIApplication.shared.open(appURL)
        } else {
            UIApplication.shared.open(webURL)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
