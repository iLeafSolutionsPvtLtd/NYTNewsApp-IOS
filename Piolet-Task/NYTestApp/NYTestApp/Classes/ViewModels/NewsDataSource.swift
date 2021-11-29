//
//  NewsDataSource.swift
//  NYTestApp
//
//  Created by Apple Developer on 29/11/21.
//  Copyright © 2021 Apple Developer. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class NewsDataSource : GenericDataSource<ArticleCellViewModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell configuration
        let cell = tableView.dequeueReusableCell(withIdentifier: kArticleCellID, for: indexPath) as! ArticleTableViewCell
        cell.selectionStyle = .none
        cell.configCellUI()

        // Set cell data
        let articleCellVM = self.data.value[indexPath.row]
        cell.articleCellVM = articleCellVM
        return cell
    }
}

