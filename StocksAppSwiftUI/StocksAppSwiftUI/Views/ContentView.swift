//
//  ContentView.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init(){
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        
        stockListVM.load()
    }
    var body: some View {
        
        let filteredStocks = self.stockListVM.searchTerm.isEmpty ? self.stockListVM.stocksVM : self.stockListVM.stocksVM.filter{$0.symbol.starts(with: self.stockListVM.searchTerm)}
        
        return NavigationView{
            ZStack{
                Color.black
                Text("January 5 2020")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(x:-100,y:-340)
                SearchView(searchTerm: $stockListVM.searchTerm)
                    .offset(y:-290)
                
                StockListView(stocks: filteredStocks)
                    .offset(y: 125)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Stocks")
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
