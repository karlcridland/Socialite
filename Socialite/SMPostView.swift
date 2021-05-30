//
//  SMPostView.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import Foundation
import UIKit

class SMPostView: UIView {
    
    let username: UILabel
    let body: UITextView
    let icon: UIImageView
    
    init(frame: CGRect, post: SMPost) {
        self.username = UILabel(frame: CGRect(x: 35, y: 6, width: frame.width-60, height: 20))
        self.body = UITextView(frame: CGRect(x: 5, y: 30, width: frame.width-10, height: frame.height-40))
        self.icon = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        super .init(frame: frame)
        
        self.username.text = post.user
        self.username.font = .systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 0.3))
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
