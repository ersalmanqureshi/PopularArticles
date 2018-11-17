//
//  ViewController.swift
//  PopularArticles
//
//  Created by Salman Qureshi on 11/17/18.
//  Copyright © 2018 Salman Qureshi. All rights reserved.
//

import UIKit

class ArticlesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    var articles: [Article]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuptableView()
        fetchMostPopularArticles()
    }

    private func setuptableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchMostPopularArticles() {
        
        activityIndicator.startAnimating()
        
        API.getMostPopularArticles(completion: { [weak self] results in
            DispatchQueue.main.async {
                
                self?.articles?.append(contentsOf: results)
                
                self?.activityIndicator.stopAnimating()
                self?.tableView.reloadData()
            }
        })
    }
}

extension ArticlesVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesCell.reuseIdentifier, for: indexPath) as? ArticlesCell else {
            return UITableViewCell()
        }
        
        //TO-DO Update Model data
        //------------
        
        
        return cell
    }
    
}

