//
//  Constant.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 03/07/22.
//

import Foundation
let apiKey = "972a8f6a4ee8059c7a1ff26ff6385f6e"

struct Constant {

    
    struct Urls{
        static func urlFoWeatherByCity(city:String)->URL{
            let userDefault = UserDefaults.standard
            let unitString = userDefault.value(forKey: "unit") as? String
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=\(apiKey)&units=\(unitString!)")!
        }
    }
}


