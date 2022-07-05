//
//  StockListViewModels.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import Foundation

class StockListViewModel : ObservableObject {
    
    @Published var searchTerm = ""
    @Published var stocksVM : [StockViewModel] = [StockViewModel]()
    
    
    public func load(){
        fetchStocks()
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
}
