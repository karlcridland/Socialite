//
//  SMFeed.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import Foundation

// Social media feed, retrieves the json file from the page.

class SMFeed {
    
    let platform: Platform
    let link: URL?
    var updates = [SMPost]()
    
    static var interval = TimeInterval(5)
    
    init(name: String){
        self.platform = Platform(rawValue: name)!
        self.link = URL(string: "https://takehome.io/\(name)")
        self.retrieve()
    }
    
    func retrieve(){

        if let link = link{
            let task = URLSession.shared.dataTask(with: link) {(data, response, error) in
                guard let data = data else { return }
                self.showResult(value: String(data: data, encoding: .utf8)!)
                
            }

            task.resume()
        }
        
        Timer.scheduledTimer(withTimeInterval: SMFeed.interval, repeats: false) { _ in
            self.retrieve()
        }
       
    }
    
    // Takes a not yet decoded string which will (hopefully) contain a json structure, if this is the case then if the message has not already been processed, it is added to the updates array and displayed on screen.
    
    func showResult(value: String){
        if let json = value.toJSON(){
            json.forEach { update in
                if let username = update[self.usernameKey()] as? String, let message = update[self.messageKey()] as? String{
                    let post = SMPost(platform: self.platform, user: username, message: message)
                    if !self.updates.contains(where: {$0 == post}){
                        self.updates.append(post)
                        self.displayPost(post)
                    }
                }
            }
        }
    }
    
    func displayPost(_ post: SMPost) {
//        let view = SMPostView(frame: <#T##CGRect#>, post: post)
    }
    
    func usernameKey() -> String {
        switch self.platform {
        case .twitter:
            return "username"
        case .instagram:
            return "username"
        case .facebook:
            return "name"
        }
    }
    
    func messageKey() -> String {
        switch self.platform {
        case .twitter:
            return "tweet"
        case .instagram:
            return "status"
        case .facebook:
            return "status"
        }
    }
}

extension String{
    func toJSON() -> [Dictionary<String,Any>]? {
        if let data = self.data(using: .utf8){
            do {
                if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]{
                    return jsonArray
                }
            } catch {
                
            }
        }
        return nil
    }
}
