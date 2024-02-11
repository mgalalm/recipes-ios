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
      // for recipe in recipes {
      //     print("==== Recipe ====")
      //     print("Name: \(recipe.name)")
      //     print("Description: \(recipe.description)")
      // }
      return recipes
    } catch {
        print("Could not query DataStore: \(error)")
    }
    return[Recipe]()
  }
}