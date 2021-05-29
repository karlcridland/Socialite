//
//  ViewController.swift
//  Socialite
//
//  Created by Karl Cridland on 29/05/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let twitter = SMFeed(name: "twitter", link: "https://takehome.io/twitter")
        twitter.retrieve()
    }


}

