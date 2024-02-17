// swiftlint:disable all
import Amplify
import Foundation

public struct Ingredient: Model, Identifiable {
  public let id: String
  public var name: String
  public var recipe: List<RecipeIngredient>?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      recipe: List<RecipeIngredient>? = []) {
    self.init(id: id,
      name: name,
      recipe: recipe,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      recipe: List<RecipeIngredient>? = [],
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.recipe = recipe
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
