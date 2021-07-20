//
//  Recipe.swift
//  RecipeListApp
//
//  Created by Surya Sama on 2021-07-18.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings: Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}

class Ingredient: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
//
//import Foundation
//
//class Recipe: Identifiable, Decodable {
//    
//    var id:UUID?
//    var name:String
//    var featured:Bool
//    var image:String
//    var description:String
//    var prepTime:String
//    var cookTime:String
//    var totalTime:String
//    var servings:Int
//    var ingredients:[String]
//    var directions:[String]
//
//}

