//
//  NewsDetailUIViewController.swift
//  NYTestApp
//
//  Created by Apple Developer on 29/11/21.
//  Copyright © 2021 Apple Developer. All rights reserved.
//

import UIKit
import Kingfisher

class NewsDetailUIViewController: UIViewController {

    @IBOutlet weak var detailLabel:UILabel!
    @IBOutlet weak var articleDetailIcon:UIImageView!

    var detailNews:String?
    var detailNewsImageUrl:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        detailLabel.text = detailNews
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadArticleImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        articleDetailIcon.image = nil
    }
    func loadArticleImage() {
        if let urlStr = detailNewsImageUrl {
            let url = URL(string: urlStr)
            //Image Cache using SDWebImage
            articleDetailIcon.kf.indicatorType = .activity
            articleDetailIcon.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeholderImage"),
                options: [
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
        }
    }

}
