//
//  SMFeed.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import Foundation

// Social media feed, retrieves the json file from the page.

class SMFeed {
    
    let name: String
    let link: URL?
    
    init(name: String, link: String){
        self.name = name
        self.link = URL(string: link)
    }
    
    func retrieve(){

        if let link = link{
            let task = URLSession.shared.dataTask(with: link) {(data, response, error) in
                guard let data = data else { return }
                print(String(data: data, encoding: .utf8)!)
            }

            task.resume()
        }
       
    }
}
