//
//  ReviewView.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 30/08/22.
//

import SwiftUI

struct ReviewView: View {
    var restaurant : Restaurant
    
    var body: some View {
        ZStack{
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth:0,maxWidth: .infinity)
                .ignoresSafeArea()
            Color.black
                .opacity(0.6)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            HStack{
                Spacer()
                VStack{
                    Button(action:{
                        
                    }){
                        Image(systemName: "xmark")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
            }
            VStack(alignment:.leading){
                ForEach(Restaurant.Rating.allCases,id: \.self){rating in
                    HStack{
                        Image(rating.image)
                        Text(rating.rawValue.capitalized)
                            .font(.system(.title,design:.rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(restaurant:Restaurant(name: "Cafe Deadend", type: "cafe", location: "Hong Konf", image: "Cafe Deadend", isFavorite: true,description: ""))
    }
}
