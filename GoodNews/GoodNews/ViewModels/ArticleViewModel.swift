//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Anupam G on 22/06/22.
//

import Foundation

protocol ArticleListViewModelDelegate : AnyObject {
    func updateUI()
}

class ArticleListViewModel {
    
    weak var delegate : ArticleListViewModelDelegate?
    var articles : [Article]?
    
    init(articles : [Article]?){
        self.articles = articles
    }
    
    func getArticleList(){
        WebServices().getArticles() {[weak self] articles in
            if let articles = articles {
                self?.articles = articles
                DispatchQueue.main.async {
                    self?.delegate?.updateUI()
                }
            }
        }
    }
}



extension ArticleListViewModel{
    var numberOfSection: Int{
        1
    }
    func numberOfRowsInSection(section : Int) -> Int{
        self.articles?.count ?? 0
    }
    
    func articlesAtIndex(index:Int) ->ArticleViewModel?{
        guard let article = self.articles?[index]else{return nil}
        return ArticleViewModel(article:article)
    }
}

struct ArticleViewModel{
    let article : Article
}

extension ArticleViewModel{
    var title : String{
        self.article.title
    }
    
    var description : String{
        self.article.description ?? ""
    }
}
