//
//  VideoTableViewCell.swift
//  youtubeApp
//
//  Created by Dawid Jaskulski on 08/07/2020.
//  Copyright © 2020 Dawid Jaskulski. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setCell(_ v:Video) {
        self.video = v
        
        guard self.video != nil else {return}
        
        self.titleLabel.text = video?.title
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = dateFormat.string(from: video!.published)
        
        guard self.video!.thumbnail != "" else {return}
        
        //check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
               
                //save the data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
               
                //check that the downloaded url matches the video thumbnail url that this cell is currenlty set to display
                if url!.absoluteString != self.video?.thumbnail {
                    
                    //video cell has been recycled for antoher viedo and no longer matches the thumbnail that was downoladed
                    return
                }
                
                 //create the image object
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        dataTask.resume()
        
    }
    
}
