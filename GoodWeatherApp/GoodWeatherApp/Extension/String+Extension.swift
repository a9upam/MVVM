//
//  String+Extension.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 03/07/22.
//

import Foundation
extension String{
    func escaped()->String{
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
