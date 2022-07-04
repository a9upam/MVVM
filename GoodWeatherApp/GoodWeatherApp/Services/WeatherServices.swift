//
//  WeatherServices.swift
//  GoodWeatherApp
//
//  Created by Anupam G on 01/07/22.
//

import Foundation


struct Resource<T>{
    let url : URL
    //take data and return generic type model
    let parse:(Data) ->T?
    
   

}

final class WebService{
    
    func load<T>(resource: Resource<T>,completion :@escaping (T?) -> ()){
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data,error == nil {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }else{
                completion(nil)
            }
        }.resume()
    }
}
