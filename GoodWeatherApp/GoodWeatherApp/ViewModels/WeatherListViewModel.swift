//
//  WeatherListViewModel.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 23/06/22.
//

import Foundation
class WeatherListViewModel{
    private var weatherVModels : [WeatherViewModel] = []
    
    func adddWeatherViewModel(vm : WeatherViewModel){
        weatherVModels.append(vm)
    }
    
    func numberOfRows(in section : Int) ->Int{
        weatherVModels.count
    }
    
    func numberOfSection() ->Int{
        1
    }
    
    func modelAtIndex(index: Int) ->WeatherViewModel{
        weatherVModels[index]
    }
    
    func updateUnit(to unit : Unit){
        switch(unit){
        case .celsius:
            toCelcius()
            
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private func toCelcius(){
        weatherVModels =  weatherVModels.map{vm in
            let weatherVM = vm
            weatherVM.temprature = (weatherVM.temprature - 32)*5/9
            return weatherVM
        }
    }
    
    private func toFahrenheit(){
        weatherVModels =  weatherVModels.map{vm in
            let weatherVM = vm
            weatherVM.temprature = (weatherVM.temprature * 9/5) + 32
            return weatherVM
        }
    }
    
}

