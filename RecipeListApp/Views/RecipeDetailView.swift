//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Surya Sama on 2021-07-18.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var index = 6
    var servings = [2,4,6,8]
    var recipe:Recipe
    var body: some View {
        
        ScrollView{
            
            VStack(alignment: .leading){
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 390, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(25)
                    .padding(.bottom, 10)
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom,5)
                VStack(alignment: .leading) {
                    Text("Servings ")
                    Picker("tap me" , selection: $index){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                    
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .bold()
                        .padding(.bottom, 5)
                    
                    
                    
                    }
                    ForEach (recipe.ingredients){ r in
                        
                        Text("•" + RecipeModel.getPortion(ingredient: r, recipeservings: recipe.servings, targetServings: index)+" " + r.name)
                            .padding([.bottom,.top], 2)
                    }
                    .padding(.horizontal)
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .bold()
                        .padding(1)
                    ForEach(0..<recipe.directions.count, id: \.self){ r in
                        Text(String(r+1) + ". " + recipe.directions[r])
                            
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                }
                
            }
            .ignoresSafeArea()
            
        }
        
        
        
    }
    
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
            
            
    }
}
