// swiftlint:disable all
import Amplify
import Foundation

extension RecipeIngredient {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case recipe
    case ingredient
    case quantity
    case unit
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let recipeIngredient = RecipeIngredient.keys
    
    model.listPluralName = "RecipeIngredients"
    model.syncPluralName = "RecipeIngredients"
    
    model.attributes(
      .index(fields: ["ingredientId", "recipeId"], name: "byIngredient"),
      .index(fields: ["recipeId", "ingredientId"], name: "byRecipe"),
      .primaryKey(fields: [recipeIngredient.id])
    )
    
    model.fields(
      .field(recipeIngredient.id, is: .required, ofType: .string),
      .belongsTo(recipeIngredient.recipe, is: .optional, ofType: Recipe.self, targetNames: ["recipeId"]),
      .belongsTo(recipeIngredient.ingredient, is: .optional, ofType: Ingredient.self, targetNames: ["ingredientId"]),
      .field(recipeIngredient.quantity, is: .required, ofType: .double),
      .field(recipeIngredient.unit, is: .optional, ofType: .string),
      .field(recipeIngredient.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(recipeIngredient.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension RecipeIngredient: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}