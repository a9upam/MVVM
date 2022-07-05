//
//  LoginViewModel.swift
//  BindingMVVM
//
//  Created by Anupam G on 05/07/22.
//

import Foundation

class Dynamic <T>{
    typealias Listner = (T)->Void
    var listner : Listner?
    
    var value : T{
        didSet{
            listner?(value)
        }
    }
    
    func bind(callBack : @escaping (T)->Void){
        self.listner = callBack
    }
    
    init(_ value : T){
        self.value = value
    }
}
struct LoginViewModel{
    var userName = Dynamic("")
    var password = Dynamic("")
}
