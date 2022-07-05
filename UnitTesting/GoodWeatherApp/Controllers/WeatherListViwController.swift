//
//  WeatherListViwController.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 23/06/22.
//

import Foundation
import UIKit
class WeatherListViwController : UITableViewController{
    
    private var weatherListViewModels = WeatherListViewModel()
    private var lastSelectedUnit : Unit!

    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        if let val = UserDefaults.standard.value(forKey: "unit") as? String{
            self.lastSelectedUnit = Unit(rawValue: val)!
        }
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherViewController"{
            prepareSequeForAddCityViewController(segue: segue)
        }
        if segue.identifier == "SettingsTableViewController"{
            prepareSequeForSettingsTableViewController(segue: segue)
        }
    }
    
    func prepareSequeForAddCityViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Nav Error")
        }
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherViewController else{
            fatalError("Error while checking for AddWeatherViewController")
        }
        addWeatherCityVC.delegate = self
    }
    
    func prepareSequeForSettingsTableViewController(segue:UIStoryboardSegue){
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("Nav Error")
        }
        guard let settingsViewmController = nav.viewControllers.first as? SettingsViewController else{
            fatalError("Error while checking for AddWeatherViewController")
        }
        settingsViewmController.delegate = self
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        weatherListViewModels.numberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherListViewModels.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? WeatherCell else{return UITableViewCell()}
        
        let vm = weatherListViewModels.modelAtIndex(index: indexPath.row)
        cell.configure(vm: vm)
        return cell
    }
    
   
}

extension WeatherListViwController:  AddWeatherDelegate{
    func addWeatherDidSave(weatheViewModel:WeatherViewModel){
        print(weatheViewModel)
        weatherListViewModels.adddWeatherViewModel(vm: weatheViewModel)
        tableView.reloadData()
    }
}

extension WeatherListViwController:  SettingsDelegate{
    func settingDidSelected(viewModel: SettingsViewModel) {
        if lastSelectedUnit.rawValue != viewModel.selectedUnit.rawValue {
            weatherListViewModels.updateUnit(to: viewModel.selectedUnit)
            tableView.reloadData()
            lastSelectedUnit = Unit(rawValue: viewModel.selectedUnit.rawValue)!
        }
    }
}
