//
//  CacheManager.swift
//  youtubeApp
//
//  Created by Dawid Jaskulski on 08/07/2020.
//  Copyright © 2020 Dawid Jaskulski. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache (_ url: String, _ data: Data?) {
     
        //store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        //try to get the data for the specified url
        return cache[url]
        
    }
}
