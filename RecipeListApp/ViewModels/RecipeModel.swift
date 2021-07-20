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
}
