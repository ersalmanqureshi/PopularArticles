//
//  ArticlesDetailVC.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import UIKit
import Kingfisher

class ArticlesDetailVC: UIViewController {

    @IBOutlet weak var articleThumbnail: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleOverview: UILabel!
    @IBOutlet weak var adsKeyword: UILabel!
    @IBOutlet weak var articleAbstract: UILabel!
    
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapGesture()
        
        ImageCache.default.retrieveImage(forKey: article.title, options: nil) {
            image, cacheType in
            if let image = image {
                self.articleThumbnail.image = image
            } else {
                print("Not exist in cache.")
            }
        }
        
        articleTitle.text = "\(article.title)"
        articleOverview.text = "\(article.byline)"
        adsKeyword.text = article.adsKeyword
        articleAbstract.text = article.abstract
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openArticleLink))
        articleThumbnail.isUserInteractionEnabled = true
        articleThumbnail.addGestureRecognizer(tapGesture)
    }
    
    @objc private func openArticleLink() {
        guard let url = URL(string: article.url) else { return }
        UIApplication.shared.open(url)
    }
}
