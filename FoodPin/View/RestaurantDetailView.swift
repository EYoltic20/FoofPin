//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 15/08/22.
//

import SwiftUI
import MapKit

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss // valur for dismissing the current value
    
    var restauarant : Restaurant
    @State var itIsFav = false
    var body: some View {
        ScrollView{
            VStack(alignment : .leading){
                Image(restauarant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth:0, maxWidth: .infinity)
                    .frame(height:445)
                    .overlay{
                        VStack{
                            //                            Button(action: $itIsFav.toggle(), label:{
                            Image(systemName: "heart")
                                .frame(minWidth:0,maxWidth: .infinity,
                                       minHeight: 0,
                                       maxHeight: .infinity,
                                       alignment: .topTrailing)
                                .padding()
                                .font(.system(size:30))
                                .foregroundColor(.white)
                            //                            })
                        }
                        VStack(alignment:.leading,spacing: 5){
                            Text(restauarant.name)
                                .font(.custom("Fuente", size: 35,relativeTo: .largeTitle))
                                .bold()
                            Text(restauarant.type)
                                .font(.system(.headline,design: .rounded))
                                .padding(.all,5)
                                .background(Color.black)
                            
                        }
                        .frame(minWidth:0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity,alignment: .bottomLeading)
                        .foregroundColor(.white)
                        .padding()
                        
                    }
                
            }
            ZStack{
                Text(restauarant.description)
                    .foregroundColor(.blue)
                    .padding()
                MapView()
                
            }
            
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
        
        .toolbar{
            ToolbarItem(placement:.navigationBarLeading){
                Button(action:{
                    dismiss()
                }){
                    Text("\(Image(systemName: "chevron.left"))\(restauarant.name)")
                    //                            .foregroundColor(.red)
                    
                }
                
            }
        }
        
        
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(restauarant: Restaurant(name: "Cafe Deadend", type: "cafe", location: "Hong Konf", image: "Cafe Deadend", isFavorite: true,description: ""))
    }
}
