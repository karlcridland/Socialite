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
    
    init(frame: CGRect, post: SMPost) {
        self.username = UILabel(frame: CGRect(x: 10, y: 5, width: frame.width-60, height: 20))
        self.body = UITextView(frame: CGRect(x: 10, y: 30, width: frame.width-20, height: frame.height-40))
        super .init(frame: frame)
        
        self.username.text = post.user
        self.body.text = post.message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
