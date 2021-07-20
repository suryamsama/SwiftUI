//
//  DataSerivce.swift
//  RecipeListApp
//
//  Created by Surya Sama on 2021-07-18.
//

import Foundation
class DataService{
 static func getLocalData() -> [Recipe]{
        //parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else{
            return [Recipe]()
        }
        //get a Url path
        let url = URL(fileURLWithPath: pathString!)
        //get a url object
        //create a data object
        do{
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    for i in r.ingredients {
                        i.id = UUID()
                    
                    }
                }
                
                
                // Return the recipes
                return recipeData
            }
            catch {
                // error with parsing json
                print(error)
            }
        }
        catch{
            print(error)
        }
        return [Recipe]()
    }
}
