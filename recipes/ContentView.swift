//
//  ContentView.swift
//  recipes
//
//  Created by Mohamed Awad on 04/02/2024.
//

import SwiftUI
import Amplify

struct ContentView: View {
    @State var recipes = [Recipe]()
    @State var searchText = ""
    @State var selectedRecipe: Recipe?
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
                VStack (spacing: 20){
                    HStack {
                        Image("list-placeholder")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(5)
                        VStack(alignment: .leading) {
                            Text(recipe.name)
                                .font(.headline)
                            Text(recipe.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image("regular_2.5")
                            .foregroundColor(.secondary)
                    }
                    Divider()
                }.listRowSeparator(.hidden)
                    .onTapGesture {
                        selectedRecipe = recipe
                    }
            }.listStyle(.plain)
            
            
        }
        
        .task {
            recipes = await service.listRecipes()
        }
        .sheet(item: $selectedRecipe) { item in
            RecipeDetailsView(recipe: item)
        }
    }
    
    
}

//
//#Preview {
//    ContentView(ingredients: $i)
//}
