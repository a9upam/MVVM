//
//  WebServices.swift
//  GoodNews
//
//  Created by Anupam G on 22/06/22.
//

import Foundation

let key = "AA"
let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=bc3003a30f14472d8e2ff3249157ec73")!

class WebServices{
    
    
    func getArticles(completion:@escaping ([Article]?) -> ()) {
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                print(data)
                do{
                    let articlesList = try JSONDecoder().decode(ArticleList.self, from: data)
                    if let articles = articlesList.articles{
                        completion(articles)
                    }
                }
                catch{
                    print(error)
                    completion(nil)
                }
            }
        }
        session.resume()
        
    }
}
