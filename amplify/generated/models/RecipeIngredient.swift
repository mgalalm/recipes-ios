// swiftlint:disable all
import Amplify
import Foundation

public struct RecipeIngredient: Model, Identifiable {
  public let id: String
  public var recipe: Recipe?
  public var ingredient: Ingredient?
  public var quantity: Double
  public var unit: String?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      recipe: Recipe? = nil,
      ingredient: Ingredient? = nil,
      quantity: Double,
      unit: String? = nil) {
    self.init(id: id,
      recipe: recipe,
      ingredient: ingredient,
      quantity: quantity,
      unit: unit,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      recipe: Recipe? = nil,
      ingredient: Ingredient? = nil,
      quantity: Double,
      unit: String? = nil,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.recipe = recipe
      self.ingredient = ingredient
      self.quantity = quantity
      self.unit = unit
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}
