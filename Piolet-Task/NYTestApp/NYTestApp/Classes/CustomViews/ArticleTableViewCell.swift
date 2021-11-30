//
//  ArticleTableViewCell.swift
//  NYTestApp
//
//  Created by Apple Developer on 29/11/21.
//  Copyright © 2021 Apple Developer. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var dateIcon:UIImageView!
    @IBOutlet weak var articleIcon:UIImageView!

    var articleCellVM : ArticleCellViewModel? {
        didSet {
            
            guard let articleCellVM = articleCellVM else {
                return
            }
            
            titleLabel?.text = articleCellVM.title
            byLineLabel?.text = articleCellVM.byLineString
            dateLabel?.text = Utils.getStringFromDate(date: articleCellVM.publishedDate)
            
            if let urlStr = articleCellVM.imageUrl {
                let url = URL(string: urlStr)
                
                let processor = DownsamplingImageProcessor(size: articleIcon.bounds.size)
                             |> RoundCornerImageProcessor(cornerRadius: 20)
                articleIcon.kf.indicatorType = .activity
                articleIcon.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "placeholderImage"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ])
                {
                    result in
                    switch result {
                    case .success(let value):
                        print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
                
                
//                //Image Cache using SDWebImage
//                articleIcon.sd_setShowActivityIndicatorView(true)
//                articleIcon.sd_setIndicatorStyle(.gray)
//                articleIcon.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder.png"), options: SDWebImageOptions.delayPlaceholder, completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellUI()
    {
        self.dateIcon?.image = #imageLiteral(resourceName: "date_icon")
        self.titleLabel?.textColor = kPrimaryTextColor
        self.byLineLabel?.textColor = kSecondryTextColor
        self.dateLabel?.textColor = kSecondryTextColor
    }
}
