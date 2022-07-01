//
//  OrderTableViewController.swift
//  CoffeeOrderingApp
//
//  Created by Anupam G on 22/06/22.
//

import Foundation
import UIKit
class OrderTableViewController : UITableViewController{
    
    var orderListVM : OrdersListViewModel = OrdersListViewModel(orders: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        guard let coffeeOrderURL = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders")else{return}
        let resource = Resource<[Order]>(url: coffeeOrderURL)
        
        WebServices().load(resource: resource) {[weak self] result in
            switch(result){
            case .success(let orders):
                print(orders)
                self?.orderListVM = OrdersListViewModel(orders: orders.map{OrderViewModel.init(order: $0)})
                self?.tableView.reloadData()
            case .failure(let networkError):
                print(networkError)
            }
        }
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        orderListVM.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orderListVM.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let orderViewModel = orderListVM.orderObjectAtIndex(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = orderViewModel.type
        cell.detailTextLabel?.text = orderViewModel.size
        return cell
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navCon = segue.destination as? UINavigationController,
              let addViewController = navCon.viewControllers.first as? AddOrderViewController else{
                  fatalError()
              }
        addViewController.delegate = self
    }
}


extension OrderTableViewController : AddOrderDelegate{
    func addCoffeeOrderDidSave(order : Order,controller : UIViewController){
        let orderVM = OrderViewModel(order: order)
        self.orderListVM.orders.append(orderVM)
        self.tableView.insertRows(at: [IndexPath(row: orderListVM.orders.count - 1, section: 0)], with: .automatic)
    }
    func addCoffeeOrderViewDidClose(controller:UIViewController){
        
    }
}
