//
//  Article.swift
//  GoodNews
//
//  Created by Anupam G on 22/06/22.
//

import Foundation

struct Article : Decodable {
    
    let title : String
    let description : String?
//    let author : String
}


struct ArticleList : Decodable{
//    let status : String
//    let totalResults : Int
    let articles : [Article]?
    
}
