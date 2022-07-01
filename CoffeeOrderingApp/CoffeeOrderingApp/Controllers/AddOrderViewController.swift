//
//  AddOrderViewController.swift
//  CoffeeOrderingApp
//
//  Created by Anupam G on 22/06/22.
//

import Foundation
import UIKit

protocol AddOrderDelegate {
    func addCoffeeOrderDidSave(order : Order,controller : UIViewController)
    func addCoffeeOrderViewDidClose(controller:UIViewController)
}
class AddOrderViewController : UIViewController{
    
    @IBOutlet weak var addOrderTableView : UITableView!
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var emailTextField : UITextField!
    
    var delegate : AddOrderDelegate?
    
    private var addCoffeeViewModel = AddCoffeeOrderViewModel()
    private var coffeeSizeSegmentedControl : UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        coffeeSizeSegmentedControl = UISegmentedControl(items: addCoffeeViewModel.size)
        coffeeSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(coffeeSizeSegmentedControl)
        coffeeSizeSegmentedControl.topAnchor.constraint(equalTo: self.addOrderTableView.bottomAnchor,constant: 20).isActive = true
        self.coffeeSizeSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.coffeeSizeSegmentedControl.bottomAnchor.constraint(equalTo: emailTextField.topAnchor,constant: 10).isActive = true
    }
    
}

extension AddOrderViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addCoffeeViewModel.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = addCoffeeViewModel.types[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    @IBAction func save(){
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        let selectedSize = coffeeSizeSegmentedControl.titleForSegment(at: coffeeSizeSegmentedControl.selectedSegmentIndex)
        guard let indexPath = self.addOrderTableView.indexPathForSelectedRow else {
            fatalError()
        }
        self.addCoffeeViewModel.name = name
        self.addCoffeeViewModel.email = email
        self.addCoffeeViewModel.selectedSize = selectedSize
        self.addCoffeeViewModel.selectedType = self.addCoffeeViewModel.types[indexPath.row]
        
        WebServices().load(resource: Order.create(viewModel: addCoffeeViewModel)) { result in
            switch(result){
            case .success(let order):
                print(order)
                if let order = order,let delegate = self.delegate{
                    DispatchQueue.main.async {
                        delegate.addCoffeeOrderDidSave(order: order, controller: self)
                    }
                }
                self.dismiss(animated: true) {
                    //
                }
            case .failure(let networkError):
                print(networkError)
            }
        }
    }
    
    @IBAction func cancel(){
        
        if let delegate = self.delegate{
            DispatchQueue.main.async {
                delegate.addCoffeeOrderViewDidClose(controller: self)
            }
        }
        
        self.dismiss(animated: true) {
            //
        }
    }
    
}
