//
//  DetailViewController.swift
//  youtubeApp
//
//  Created by Dawid Jaskulski on 11/08/2020.
//  Copyright © 2020 Dawid Jaskulski. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var textView: UITextView!
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        //check if there is video
        guard video != nil else {return}
        
        let embedURL = Constansts.YT_EMBED_URL + video!.videoId
        
        let url = URL(string:embedURL)
        let request = URLRequest(url: url!)
        webView.load(request)
       
        
        titleLabel.text = video!.title
        textView.text = video?.description
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dateFormat.string(from: video!.published)
    }

    
}
