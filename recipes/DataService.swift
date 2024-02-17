//
//  DataService.swift
//  recipes
//
//  Created by Mohamed Awad on 04/02/2024.
//

import Foundation
import Amplify
struct DataService {
  func listRecipes() async -> [Recipe] {
     do {
      let recipes = try await Amplify.DataStore.query(Recipe.self)
      return recipes
    } catch {
        print("Could not query DataStore: \(error)")
    }
    return[Recipe]()
  }


    func listIngredients(recipe: Recipe) async -> [RecipeIngredient] {
      do {
        let recipeIngredients = try await recipe.ingredients
          try await recipeIngredients?.fetch()
          // for ingreident in recipeIngredients ?? [] {
          //         print("\(ingreident)")
          // }
        // intreating over the list of recipeIngredients and populating the ingredients array
        // convert the list of recipeIngredients to an array of RecipeIngredient
          return Array(recipeIngredients!)

        
      } catch {
        print("Could not query DataStore: \(error)")
      }
      return [RecipeIngredient]()
    }
  }
