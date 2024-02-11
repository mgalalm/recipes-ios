//
//  ContentView.swift
//  recipes
//
//  Created by Mohamed Awad on 04/02/2024.
//

import SwiftUI


struct ContentView: View {
    @State var recipes = [Recipe]()
    @State var searchText = ""
    var service = DataService()
    var body: some View {
        VStack {
            HStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.secondary)
                }
            }
            List(recipes, id: \.id) { recipe in
                VStack(alignment: .leading) {
                    Text(recipe.name)
                        .font(.headline)
                    Text(recipe.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
           
        }
        .padding()
        .task {
             recipes = await service.listRecipes()
        }
    }
}

#Preview {
    ContentView()
}
