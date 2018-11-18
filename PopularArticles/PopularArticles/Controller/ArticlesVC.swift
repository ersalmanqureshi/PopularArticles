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
    
    var articles: [Article]? = []
    
    let segueIdentifier = "listingToDetailSegue"
    
    let service = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setuptableView()
        fetchMostPopularArticles()
    }

    private func setuptableView() {
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.tableFooterView = UIView()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchMostPopularArticles() {
        
        view.makeToastActivity(.center)
        
        service.getMostPopularArticles(completion: { [weak self] results, error  in
            DispatchQueue.main.async {
                
                if error != nil {
                    //Some toast
                    
                    if error == NetworkingErrors.noInternetConnection {
                        self?.view.makeToast("No internet connection", duration: 2.0, position: .center)
                    } else {
                        self?.view.makeToast("Error parsing JSON", duration: 2.0, position: .center)
                    }
                    
                } else {
                    //self?.view.makeToast("Success", duration: 2.0, position: .center)
                    self?.articles?.append(contentsOf: results!)
                }
                
                self?.view.hideToastActivity()
                self?.tableView.reloadData()
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

