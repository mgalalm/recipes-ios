//
//  RecipeDetails.swift
//  recipes
//
//  Created by Mohamed Awad on 11/02/2024.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe?
    var body: some View {
        Text(recipe?.name ?? "No name")
    }

}

#Preview {

    RecipeDetailsView(recipe: Recipe(id: "1", name: "Recipe 1", description: "Description 1", category: "Category 1", image: "Image 1", ingredients: []))
}
   
