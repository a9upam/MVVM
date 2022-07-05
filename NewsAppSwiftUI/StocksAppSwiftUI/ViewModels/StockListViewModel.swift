//
//  StockListViewModels.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import Foundation
import SwiftUI

class StockListViewModel : ObservableObject {
    
    @Published var searchTerm = ""
    @Published var stocksVM : [StockViewModel] = [StockViewModel]()
    @Published var news = [NewsArticleViewModel]()
    @Published var dragOffset = CGSize(width: 0, height: 680)
  
    public func load(){
//        fetchStocks()
        fetchNews()
    }
    
    
    private func fetchStocks(){
        WebServices.shared.getStocks {stocks in
            if let stocks = stocks{
                DispatchQueue.main.async {
                    self.stocksVM = stocks.map{StockViewModel(stock: $0)}
                }
            }
        }
    }
    
    private func fetchNews(){
        WebServices.shared.getTopNews {[weak self] news in
            if let news = news {
                self?.news  = news.map{NewsArticleViewModel(article: $0)}
            }
        }
    }
}
