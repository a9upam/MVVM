//
//  AddCoffeeOrderViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Anupam G on 23/06/22.
//

import Foundation
struct AddCoffeeOrderViewModel{
    
    var name : String?
    var email : String?
    
    var selectedType : String?
    var selectedSize : String?
    
    var types :[String]{
        CoffeeType.allCases.map{$0.rawValue.capitalized}
    }
    
    var size :[String]{
        CoffeeSize.allCases.map{$0.rawValue.capitalized}
    }
}
