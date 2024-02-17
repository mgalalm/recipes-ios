//
//  RecipeDetails.swift
//  recipes
//
//  Created by Mohamed Awad on 11/02/2024.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe?
    @State var recipeIngredients = [RecipeIngredient]()
    // define an empty array of RecipeIngredient
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                Image("recipe-details-placeholder")
                    .resizable()
                VStack {
                    Spacer()
                    Image("attrbuition-placeholder")
                        .frame(width: 72, height: 36)
                }
            }.frame(height: 164)
            ZStack(alignment:.leading) {
                Rectangle()
                    .foregroundStyle(.green)
                
                Text("Total Time: 30 minutes")
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                
            }.frame(height: 36)
            
            Text(recipe?.name ?? "")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            Text(recipe?.category ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            Image("regular_2.5")
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            Divider()
            Text(recipe?.description ?? "")
                .font(.body)
                .foregroundColor(.secondary)
            Divider()
            List(recipeIngredients ,  id: \.id) { ingredient in
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(ingredient.ingredient?.name ?? "")
                            .font(.headline)
                        Text("\(ingredient.quantity) \(ingredient.unit ?? "")")
                            .font(.headline)
                    }  
                }.listRowSeparator(.hidden)
                
            }.listStyle(.plain)
            
            
        }.task {
            do {
                let myingredients = recipe?.ingredients
                try await myingredients?.fetch()
                for ingredient in myingredients ?? [] {
                    recipeIngredients.append(ingredient)
                }
            } catch {
                print("Could not query DataStore: \(error)")
            }
        }
        
    }
    
}

