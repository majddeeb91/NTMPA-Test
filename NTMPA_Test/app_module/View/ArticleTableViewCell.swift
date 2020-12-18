//
//  ArticleTableViewCell.swift
//  NTMPA_Test
//
//  Created by Majd Deeb on 16/12/2020.
//  Copyright © 2020 Majd Deeb. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    var currentArticle : Results!
    
    @IBOutlet weak var articleImageView: UIImageView!{
        didSet{
            if articleImageView != nil{
                articleImageView.layer.cornerRadius = articleImageView.frame.height / 2
            }
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var publishedDataLabel: UILabel!
    
    class var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData() -> () {
        
        if currentArticle.media?.count ?? 0 > 0{
            
        
        let articleMedia = currentArticle.media?[0]
            let thumbObj = articleMedia?.media_metadata![0]
            let thumbUrlString = thumbObj?.url
        if thumbUrlString != nil{
            let thumbUrl = URL(string: thumbUrlString!)
          self.articleImageView.kf.setImage(with: thumbUrl)
        }
       
        }
        self.titleLabel.text = currentArticle.title
        self.byLineLabel.text = currentArticle.byline
        self.publishedDataLabel.text = currentArticle.published_date
        
       }
    
}
