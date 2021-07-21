//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Surya Sama on 2021-07-20.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            Text("Featured Recipie")
                .bold()
                .padding(.leading)
            GeometryReader{ geo in
                TabView{
                    ForEach(0..<model.recipes.count){ index in
                        if model.recipes[index].featured{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing:0){
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                            .padding(5)

                                }
                                
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 3, y: 5)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack{
                Text("1.2.3")
                Text("1.2.3")
                Text("1.2.3")
                Text("1.2.3")
                Text("1.2.3")
                Text("1.2.3")
                
            }
            .padding(.leading)

        }
        
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
