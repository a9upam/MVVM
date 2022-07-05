//
//  SearchView.swift
//  StocksAppSwiftUI
//
//  Created by Anupam G on 04/07/22.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm : String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $searchTerm)
                .foregroundColor(.primary)
                .padding(10)
            Spacer()
        }
        .foregroundColor(Color.secondary)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}
