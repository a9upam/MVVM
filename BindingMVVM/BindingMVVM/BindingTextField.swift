//
//  BindingTextField.swift
//  BindingMVVM
//
//  Created by Anupam G on 05/07/22.
//

import Foundation
import UIKit
class BindingTextFiled : UITextField{
    
    var textChnaged : (String) ->Void = {_ in}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    private func commonInit(){
        addTarget(self, action: #selector(textfieldDidChanged), for: .editingChanged)
    }
    
    @objc func textfieldDidChanged(textField : UITextField){
        if let text = textField.text{
            textChnaged(text)
        }
    }
    
    func bind(callBack : @escaping (String) ->Void){
        textChnaged = callBack
    }
}
