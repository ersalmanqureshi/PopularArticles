//
//  ArticlesCell.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import UIKit

class ArticlesCell: UITableViewCell {

    static let reuseIdentifier = "ArticlesCell"
    
    var movie: Article? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
