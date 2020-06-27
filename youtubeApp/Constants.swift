//
//  Constants.swift
//  youtubeApp
//
//  Created by Dawid Jaskulski on 26/06/2020.
//  Copyright © 2020 Dawid Jaskulski. All rights reserved.
//

import Foundation

struct Constansts{
    
    static var API_KEY = ""
    static var PLAYLIST_ID = "PLQy4TFWiduPr65FKuVWfS58gythNQBYOQ"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constansts.PLAYLIST_ID)&key=\(Constansts.API_KEY)"
}
