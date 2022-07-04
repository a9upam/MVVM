//
//  AddWatherViewModel.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 03/07/22.
//

import Foundation

struct AddWeatherViewModel{
     
    
    func addWeather(for city: String, complition: @escaping (WeatherViewModel) ->Void){
        let weatherUrl = Constant.Urls.urlFoWeatherByCity(city: city)
        let weatherResponse = Resource<WeatherResponse>(url: weatherUrl) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        WebService().load(resource: weatherResponse) { result in
            if let result = result {
                let weatherViewMode = WeatherViewModel(weatherResponse: result)
                complition(weatherViewMode)
            }
        }
    }
}
