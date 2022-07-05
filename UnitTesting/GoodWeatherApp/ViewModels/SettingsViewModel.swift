//
//  SettingsViewModel.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 23/06/22.
//

import Foundation
import UIKit


enum Unit: String,CaseIterable{
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit{
    var displayName : String{
        get {
            switch(self){
            case .celsius:
                return "Celcius"
            case .fahrenheit:
                return "fahrenheit"
            }
        }
    }
}


public class SettingsViewModel{
    
    let units = Unit.allCases
    
    var selectedUnit : Unit{
        get{
            let userDefault = UserDefaults.standard
            var unitValue = ""
            if let value = userDefault.value(forKey: "unit") as? String{
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        set{
            let userDefault = UserDefaults.standard
            userDefault.set(newValue.rawValue, forKey: "unit")
        }
    }
}
