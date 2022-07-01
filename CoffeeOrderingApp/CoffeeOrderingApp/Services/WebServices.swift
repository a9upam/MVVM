//
//  WebServices.swift
//  CoffeeOrderingApp
//
//  Created by Anupam G on 22/06/22.
//

import Foundation

enum HTTPMethod : String{
    case get = "GET"
    case post = "POST"
}
struct Resource <T:Codable>{
    let url : URL
    var httpMethod :HTTPMethod = .get
    var body :Data? = nil
}

class WebServices {
    
    func load<T>(resource : Resource<T>,completion :@escaping (Result<T,NetworkError>) -> ()){
        
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,error == nil else {
                completion(.failure(.domainError))
                return
            }
            do {
                let result =  try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }catch{
                print(error)
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

enum NetworkError : Error{
    case badURLError
    case decodingError
    case domainError
}


extension Data{
    func toJson() ->String?{
        do {
            return try JSONSerialization.jsonObject(with: self, options: .mutableContainers) as? String
        }catch{
            print(error)
        }
        return nil
    }
}
