//
//  SMFView.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import Foundation
import UIKit

class SMFView: UIView {
    
    init(frame: CGRect, feed: SMFeed) {
        super .init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct SMFPost{
    let username: String
    let message: String
}
