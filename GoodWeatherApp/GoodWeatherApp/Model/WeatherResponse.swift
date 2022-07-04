//
//  WeatherResponse.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 01/07/22.
//

import Foundation
struct WeatherResponse : Decodable{
    let main : Weather
    let name : String
}

struct Weather : Decodable {
    let temp : Double
    let humidity : Double
}
