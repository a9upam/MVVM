//
//  StockListView.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import SwiftUI

struct StockListView: View {
    
    let stocks : [StockViewModel]
    
    var body: some View {
        List(self.stocks,id:\.symbol){stock in
            StockCellView(stockVM:stock)
        }
        .background(Color.black)
    }
}

struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        let stocks = [Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")]
        StockListView(stocks: stocks.map{StockViewModel(stock: $0)})
    }
}
