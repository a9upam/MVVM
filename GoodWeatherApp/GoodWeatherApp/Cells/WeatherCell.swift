//
//  WeatherCell.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 01/07/22.
//

import Foundation
import UIKit
class WeatherCell: UITableViewCell{
    @IBOutlet weak var cityName : UILabel!
    @IBOutlet weak var tempratureLabel : UILabel!
    
    
    func configure(vm:WeatherViewModel){
        cityName?.text = vm.city
        tempratureLabel?.text = String(format: "%0.2f °", vm.temprature) 
    }
}

