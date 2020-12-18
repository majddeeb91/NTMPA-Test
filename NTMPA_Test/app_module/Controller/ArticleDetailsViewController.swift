//
//  ArticleDetailsViewController.swift
//  NTMPA_Test
//
//  Created by Majd Deeb on 16/12/2020.
//  Copyright © 2020 Majd Deeb. All rights reserved.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var publishedByLabel: UILabel!
    
    class var identifier: String {
        return String(describing: self)
    }
    
    var  currentArticle : Results!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article Details"
        self.loadData()
        
    }
    
    
    func loadData(){
        self.titleLabel.text = currentArticle.title
        self.abstractLabel.text = currentArticle.abstract
        self.publishedByLabel.text = currentArticle.byline
        self.publishedDateLabel.text = currentArticle.published_date
    }
    
    
}
