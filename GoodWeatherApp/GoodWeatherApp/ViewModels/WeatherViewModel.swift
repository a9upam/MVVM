//
//  WeatherViewModel.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 23/06/22.
//

import Foundation
class WeatherViewModel{
    private var weatherResponse: WeatherResponse
    var temprature : Double
    
    init(weatherResponse:WeatherResponse) {
        self.weatherResponse = weatherResponse
        temprature = weatherResponse.main.temp
    }
    
    
    var city : String{
        weatherResponse.name
    }
    
    
    var humidity : String{
        weatherResponse.main.humidity.description
    }
    
    
}
