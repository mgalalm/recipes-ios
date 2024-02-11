// swiftlint:disable all
import Amplify
import Foundation

public struct Recipe: Model, Identifiable {
  public let id: String
  public var name: String
  public var description: String
  public var category: String
  public var image: String?
  public var ingredients: List<RecipeIngredient>?
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      name: String,
      description: String,
      category: String,
      image: String? = nil,
      ingredients: List<RecipeIngredient> = []) {
    self.init(id: id,
      name: name,
      description: description,
      category: category,
      image: image,
      ingredients: ingredients,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      name: String,
      description: String,
      category: String,
      image: String? = nil,
      ingredients: List<RecipeIngredient> = [],
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.name = name
      self.description = description
      self.category = category
      self.image = image
      self.ingredients = ingredients
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}