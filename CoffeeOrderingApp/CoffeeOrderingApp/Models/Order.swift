//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by Anupam G on 22/06/22.
//

import Foundation

struct Order : Codable{
    let name : String
    let email : String
    let type : CoffeeType
    let size : CoffeeSize
}

enum CoffeeType : String,Codable,CaseIterable{
    case cappuccuion
    case expresso
    case regular
    case cortado
    case latte
}

enum CoffeeSize : String,Codable,CaseIterable{
    case small
    case medium
    case large
}

extension Order{
    
    init?(_ vm:AddCoffeeOrderViewModel){
        guard let name = vm.name,
              let email = vm.email,
              let type = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let size = CoffeeSize(rawValue: vm.selectedSize!.lowercased())
        else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
}

extension Order{
    
    static func create(viewModel : AddCoffeeOrderViewModel) ->Resource<Order?>{
        let order = Order(viewModel)
        let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders")!
        guard let data = try? JSONEncoder().encode(order)else{
            fatalError()
        }
        return Resource(url: url, httpMethod: .post, body: data)
    }
    
    
    static var all:Resource<[Order]> = {
        let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders")!
        return Resource<[Order]>(url:url)
    }()
}
