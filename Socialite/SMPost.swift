//
//  SMPost.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import Foundation

class SMPost{
    let platform: Platform
    let user: String
    let message: String
    
    init(platform: Platform, user: String, message: String){
        self.platform = platform
        self.user = user
        self.message = message
    }
    
    static func ==(left: SMPost, right: SMPost) -> Bool {
        return left.user == right.user && left.message == right.message && left.platform == right.platform
    }
    
    static func !=(left: SMPost, right: SMPost) -> Bool {
        return !(left == right)
    }
    
}

enum Platform: String{
    case twitter = "twitter"
    case instagram = "instagram"
    case facebook = "facebook"
}
