//
//  NewsLisTableViewController.swift
//  GoodNews
//
//  Created by Anupam G on 22/06/22.
//

import Foundation
import UIKit
class NewsLisTableViewController:UITableViewController{
    
    private var articleListViewModel : ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        articleListViewModel = ArticleListViewModel(articles: nil)
        articleListViewModel?.delegate = self
        articleListViewModel?.getArticleList()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.articleListViewModel?.numberOfSection ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articleListViewModel?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleObject = self.articleListViewModel?.articlesAtIndex(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleCell
        cell?.titleLabel.text = articleObject?.title
        cell?.descLabel.text = articleObject?.description
        return cell!
    }
    
}

extension NewsLisTableViewController :ArticleListViewModelDelegate{
    func updateUI() {
        self.tableView.reloadData()
    }
}
