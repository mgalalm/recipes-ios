// swiftlint:disable all
import Amplify
import Foundation

extension Ingredient {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case recipe
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let ingredient = Ingredient.keys
    
    model.listPluralName = "Ingredients"
    model.syncPluralName = "Ingredients"
    
    model.attributes(
      .primaryKey(fields: [ingredient.id])
    )
    
    model.fields(
      .field(ingredient.id, is: .required, ofType: .string),
      .field(ingredient.name, is: .required, ofType: .string),
      .hasMany(ingredient.recipe, is: .optional, ofType: RecipeIngredient.self, associatedWith: RecipeIngredient.keys.ingredient),
      .field(ingredient.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(ingredient.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Ingredient: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}