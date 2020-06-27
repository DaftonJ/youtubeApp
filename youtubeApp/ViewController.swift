//
//  ViewController.swift
//  youtubeApp
//
//  Created by Dawid Jaskulski on 25/06/2020.
//  Copyright © 2020 Dawid Jaskulski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
  
    }
    

}

