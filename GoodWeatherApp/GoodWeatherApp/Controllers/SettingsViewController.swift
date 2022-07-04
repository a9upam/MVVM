//
//  SettingsViewController.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 23/06/22.
//

import Foundation
import UIKit


protocol SettingsDelegate{
    func settingDidSelected(viewModel : SettingsViewModel)
}


class SettingsViewController: UITableViewController{
    
    
    private var  settingsVM = SettingsViewModel()
    var delegate : SettingsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsVM.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsObject = settingsVM.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text  = settingsObject.displayName
        if settingsObject == settingsVM.selectedUnit{
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
        }
        let selectedObject = settingsVM.units[indexPath.row]
        settingsVM.selectedUnit = selectedObject
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .none
        }
    }
    
    @IBAction func doneButotn(){
        if let delegate = delegate {
            delegate.settingDidSelected(viewModel: settingsVM)
        }
        self.dismiss(animated: true, completion: nil)
    }
}
