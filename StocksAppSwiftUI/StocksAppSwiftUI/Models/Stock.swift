//
//  Stock.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import Foundation

struct Stock : Decodable{
    let symbol : String
    let description : String
    let price : Double
    let change : String
}
