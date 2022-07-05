//
//  NewsArticlesView.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 05/07/22.
//

import SwiftUI
import URLImage

struct NewsArticlesView: View {
    let news : [NewsArticleViewModel]
    let onDragBegin : (DragGesture.Value) ->Void
    let onDragEnd : (DragGesture.Value) ->Void
    
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        return VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading){
                    Text("Top News")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                        .foregroundColor(Color.white)
                    
                    
                    Text("Top Appple News")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                
                
            }
            .padding()
            .contentShape(Rectangle())
            
            .gesture(DragGesture().onChanged(self.onDragBegin).onEnded(self.onDragEnd))
            
            
            ScrollView {
                VStack {
                    ForEach(self.news ,id: \.title ){article in
                        HStack {
                            VStack(alignment : .leading) {
                                Text(article.publication)
                                    .font(.custom("Arial", size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text(article.title)
                                    .font(.custom("Arial", size: 18))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            URLImage(URL(string: article.imageURL)!) { image in
                                image.resizable()
                            }.frame(width: 100, height: 100)
                                .padding(20)
                        }
                        
                    }.frame(maxWidth: .infinity)
                }
            }
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
            .frame(width: screenSize.width, height: screenSize.height, alignment: .center)
            .cornerRadius(20)
            
        }
        
    }
}

struct NewsArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "Title", imageURL: "ImageURL", description: "DESC", author: "Author Name")
        let articleVM = NewsArticleViewModel(article: article)
        NewsArticlesView(news: [articleVM],onDragBegin: {_ in},onDragEnd: { _ in})
    }
}
