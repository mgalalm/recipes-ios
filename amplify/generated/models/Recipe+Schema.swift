// swiftlint:disable all
import Amplify
import Foundation

extension Recipe {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case description
    case category
    case image
    case ingredients
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let recipe = Recipe.keys
    
    model.listPluralName = "Recipes"
    model.syncPluralName = "Recipes"
    
    model.attributes(
      .primaryKey(fields: [recipe.id])
    )
    
    model.fields(
      .field(recipe.id, is: .required, ofType: .string),
      .field(recipe.name, is: .required, ofType: .string),
      .field(recipe.description, is: .required, ofType: .string),
      .field(recipe.category, is: .required, ofType: .string),
      .field(recipe.image, is: .optional, ofType: .string),
      .hasMany(recipe.ingredients, is: .optional, ofType: RecipeIngredient.self, associatedWith: RecipeIngredient.keys.recipe),
      .field(recipe.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(recipe.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Recipe: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}