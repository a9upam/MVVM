//
//  WebServices.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import Foundation
class WebServices{
    
    public static let shared = WebServices()
    
    private init() {}
    
    func getStocks(completion :@escaping ([Stock]?) ->()){
        guard let url = URL(string: "https://silicon-rhinoceros.glich.me/stocks") else{
            fatalError("URL is not correct")
        }
        let urlRequest = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 2)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            //In case of API Not working
            
            if error != nil{
                let stocks = [
                    Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23"),
                    Stock(symbol: "AMAZ", description: "Amazon Stocks", price: 232, change: "+0.45"),
                    Stock(symbol: "TATA", description: "Tata Stocks", price: 334, change: "+4.45"),
                    Stock(symbol: "ACN", description: "Accenture Stocks", price: 232, change: "+0.45")
                ]
                completion(stocks)
            }
            if let data = data,error == nil {
                if let stocks = try? JSONDecoder().decode([Stock].self, from: data){
                    completion(stocks)
                }
                completion(nil)
            }
        }.resume()
    }
}
