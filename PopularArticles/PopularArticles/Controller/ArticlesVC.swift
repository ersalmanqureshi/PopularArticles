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
    
    let segueIdentifier = "listingToDetailSegue"
    
    let service = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuptableView()
        setupActivityIndicator()
        fetchMostPopularArticles()
    }

    private func setuptableView() {
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.tableFooterView = UIView()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupActivityIndicator(){
        // set up activity indicator
        activityIndicator.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
        activityIndicator.color = UIColor.gray
        tableView.addSubview(activityIndicator)
    }
    
    private func fetchMostPopularArticles() {
        
        activityIndicator.startAnimating()
        
        service.getMostPopularArticles(completion: { [weak self] results, error  in
            DispatchQueue.main.async {
                
                if error != nil {
                    //Some toast
                } else {
                    self?.articles?.append(contentsOf: results!)
                }
                
                self?.activityIndicator.stopAnimating()
                
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destinationVC = segue.destination as! ArticlesDetailVC
            destinationVC.article = sender as? Article
        }
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
        
        cell.article = articles?[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles?[indexPath.row]
        performSegue(withIdentifier: segueIdentifier, sender: article!)
    }
}

