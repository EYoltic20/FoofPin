//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 15/08/22.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.dismiss) var dismiss // valur for dismissing the current value
    
    var restauarant : Restaurant
    
    var body: some View {
            ZStack (alignment:.top){
                Image(restauarant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth:0 , maxWidth: .infinity)
                    
                    .ignoresSafeArea()
                Color.black
                    .frame(height:100)
                    .opacity(0.8)
                    .cornerRadius(20)
                    .padding()
                    .overlay{
                        VStack(spacing: 5){
                            Text(restauarant.name)
                            Text(restauarant.type)
                            Text(restauarant.location)
                        }
                        
//                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                        .font(.system(.headline,design: .rounded))
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        
                    }
                
            }
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
        RestaurantDetailView(restauarant: Restaurant(name: "Cafe Deadend", type: "cafe", location: "Hong Konf", image: "Cafe Deadend", isFavorite: true))
    }
}
