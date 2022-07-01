//
//  OrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Anupam G on 22/06/22.
//

import Foundation

struct OrdersListViewModel {
    
    var orders : [OrderViewModel]
    
    init(orders: [OrderViewModel]){
        self.orders = orders
    }
    
    var numberOfSection : Int{
        1
    }
    
    func numberOfRowsInSection(section:Int) ->Int{
        self.orders.count
    }
    
    func orderObjectAtIndex(at index:Int) ->OrderViewModel{
        self.orders[index]
    }
    
}




struct OrderViewModel {
    
    let order : Order
    
//    init(order:Order){
//        self.order = order
//    }
    
    var name : String{
        self.order.name
    }
    
    var size : String{
        self.order.size.rawValue.capitalized
    }
    
    var type : String{
        self.order.type.rawValue.capitalized
    }
    
    var email : String{
        self.order.email
    }
}
