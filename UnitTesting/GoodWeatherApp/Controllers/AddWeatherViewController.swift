//
//  AddWeatherViewController.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 23/06/22.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(weatheViewModel:WeatherViewModel)
}
class AddWeatherViewController :UIViewController{
    
    var delegate : AddWeatherDelegate?
    
    @IBOutlet weak var cityNameTextField : UITextField!
    
    private var addWeatherVM = AddWeatherViewModel()

    @IBAction func saveCityButtonPressed(sender : UIButton){
        if let cityName = cityNameTextField.text{
            addWeatherVM.addWeather(for: cityName) { weatherViewModel in
                self.delegate?.addWeatherDidSave(weatheViewModel: weatherViewModel)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func closeAction(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    
}
