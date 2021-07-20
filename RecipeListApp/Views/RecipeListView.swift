//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Surya Sama on 2021-07-18.
//

import SwiftUI

struct RecipeListView: View {
    @ObservedObject var model = RecipeModel()
    var body: some View {
        NavigationView {
            List(model.recipes){ r in
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack(spacing: 10){
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(5.0)
                            Text(r.name)
                          
                        }
                    })
            }
          
            .ignoresSafeArea()

            .navigationBarTitle("All Recipies")
            .font(.headline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            
    }
}
