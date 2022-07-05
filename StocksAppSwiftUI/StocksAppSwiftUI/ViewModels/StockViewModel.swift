//
//  StockViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import Foundation
struct StockViewModel {
    let stock : Stock
    
    
    var symbol : String{
        stock.symbol.uppercased()
    }
    
    var description : String{
        stock.description
    }
    
    var price : String{
        String(format: "%.2f", stock.price)
    }
    
    var change : String{
        stock.change
    }
}
