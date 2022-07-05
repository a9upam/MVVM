//
//  StockCell.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import SwiftUI

struct StockCellView: View {
    
    let stockVM : StockViewModel
    var body: some View {
        return HStack{
            VStack(alignment: .leading){
                Text(stockVM.symbol)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    .font(.custom("Arial", size: 22))
                
                
                Text(stockVM.description)
                    .foregroundColor(Color.gray)
                    .font(.custom("Arial", size: 18))
            }
            
            Spacer()
            VStack{
                Text(stockVM.price)
                    .foregroundColor(Color.white)
                    .font(.custom("Arial", size: 22))
                
                Button(stockVM.change){
                    
                }
                .frame(width: 75)
                .padding(5)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(6)
            }
        }
        .background(Color.black)
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        let stock = Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")
        StockCellView(stockVM: StockViewModel(stock: stock))
    }
}
