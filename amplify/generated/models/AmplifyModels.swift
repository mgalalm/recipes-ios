// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "5b3662a460c5fc6eebaa11d27bcc3743"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Recipe.self)
    ModelRegistry.register(modelType: Ingredient.self)
    ModelRegistry.register(modelType: RecipeIngredient.self)
  }
}