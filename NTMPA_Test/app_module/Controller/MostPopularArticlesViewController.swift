//
//  MostPopularArticlesViewController.swift
//  NTMPA_Test
//
//  Created by Majd Deeb on 16/12/2020.
//  Copyright © 2020 Majd Deeb. All rights reserved.
//

import UIKit

class MostPopularArticlesViewController: UIViewController {
    
    var getMostPopularArticles: GetMostPopularArticlesModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "NY Times Most Popular"
        // self.navigationController?.navigationBar.barTintColor = .blue
        // configure tableView
        self.tableView.register(ArticleTableViewCell.nib, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.getMostPopularArticlesRequest()
    }
    
    // MARK: - Api Requestes
    func getMostPopularArticlesRequest(){
        self.showLoading()
        Networking.ApiRequests.getMostPopularArticles{ (model) in
            if model != nil{
                if model?.status != "OK"{
                    DispatchQueue.main.async {
                        self.presentErrorAlert(with: "Server Error")
                    }
                }
                else{
                    // show details
                    
                    self.getMostPopularArticles = model
                    DispatchQueue.main.async {
                        // self.loadData()
                        self.tableView.reloadData()
                    }
                }
            }
            else{
                DispatchQueue.main.async {
                    self.presentErrorAlert(with: "General Error")
                }
            }
            DispatchQueue.main.async {
                self.hideLoading()
            }
        }
    }
    
}



extension MostPopularArticlesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if getMostPopularArticles != nil{
            return getMostPopularArticles?.results?.count ?? 0
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as! ArticleTableViewCell
        cell.currentArticle = self.getMostPopularArticles.results![indexPath.row]
        cell.loadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if getMostPopularArticles != nil{
        let selectedArticle = getMostPopularArticles.results?[indexPath.row]
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let articleDetailsVC = storyboard.instantiateViewController(identifier: ArticleDetailsViewController.identifier) as! ArticleDetailsViewController
            articleDetailsVC.currentArticle = selectedArticle
        self.navigationController?.pushViewController(articleDetailsVC, animated: true)
        }
    }
}
