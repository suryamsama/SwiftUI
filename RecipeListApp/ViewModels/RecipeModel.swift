//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Surya Sama on 2021-07-18.
//

import Foundation
class RecipeModel: ObservableObject{
   @Published var recipes = [Recipe]()
    init() {
        self.recipes = DataService.getLocalData()
    }
   static func getPortion(ingredient: Ingredient,recipeservings:Int , targetServings: Int ) -> String{
        var portion = ""
    var numerator = ingredient.num ?? 1
    var denominator = ingredient.denom ?? 1
    var wholeportions = 0
    if ingredient.num != 0{
        denominator *= recipeservings
        numerator *= targetServings
        
        let divisor = Rational.greatestCommonDivisor(numerator, denominator)
        numerator /= divisor
        denominator /= divisor
        if numerator>denominator{
            wholeportions = numerator/denominator
            numerator = numerator % denominator
            portion = String(wholeportions)
        }
        if numerator > 0{
            portion += wholeportions > 0 ? " " : ""
            portion += "\(numerator)/\(denominator)"
        }
        
        if var unit = ingredient.unit {
            
            // If we need to pluralize
            if wholeportions > 1 {
            
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
    }
    return portion
    }
}
