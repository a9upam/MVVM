//
//  File.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 05/07/22.
//

import Foundation
struct NewsArticleViewModel{
    let article : Article
    
    var imageURL : String{
        article.imageURL
    }
    
    var title : String{
        article.title
    }
    
    var publication : String{
        article.author.uppercased()
    }
}

//class NewsArticleListViewModel{
//    
//    @Published var news = [NewsArticleViewModel]()
//    func load(){
//        fetchNews()
//    }
//
//    private func fetchNews(){
//        WebServices.shared.getTopNews {[weak self] news in
//            if let news = news {
//                self?.news  = news.map{NewsArticleViewModel(article: $0)}
//            }
//        }
//    }
//    
//}
