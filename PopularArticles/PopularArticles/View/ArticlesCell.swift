//
//  ArticlesCell.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlesCell: UITableViewCell {

    static let reuseIdentifier = "ArticlesCell"
    
    @IBOutlet weak var articleMedia: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var articleType: UILabel!
    
    var article: Article? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
        guard let article = article else { return }
        
        if let media = article.media, let metaData = media.first,
            let mediaMetadata = metaData.media_metadata {
            
            let thumnailMetaData = mediaMetadata.filter {
                $0.format == "Large"
            }
            
            let imageurl = thumnailMetaData[0].url
            
            let resource = ImageResource(downloadURL: URL(string: imageurl)!, cacheKey: article.title)
            
            articleMedia.kf.indicatorType = .activity
            articleMedia.kf.setImage(with: resource, options: [.transition(.fade(0.3))])
        }
        
        articleTitle.text = article.title
        publishDate.text = article.publishDate
        author.text = article.byline
        articleType.text = article.articleType
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
