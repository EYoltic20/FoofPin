//
//  ContentView.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 31/05/22.
//

import SwiftUI


struct RestaurantListView: View {
    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location:
                    "Hong Kong", image: "Cafe Deadend", isFavorite: false,description: "kkkk"),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:
                    "Homei", isFavorite: false,description: "k"),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "Teakha", isFavorite: false,description: ""),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "Cafe Loisl", isFavorite: false,description: ""),Restaurant(name: "Petite Oyster", type: "French",location: "Hong Kong", image: "Petite Oyster", isFavorite: false,description: ""),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "HongKong", image: "For Kee Restaurant", isFavorite: false,description: ""),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "Po's Atelier", isFavorite: false,description: ""),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location:"Sydney", image: "Bourke Street Bakery", isFavorite: false,description: ""),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "Haigh's Chocolate", isFavorite: false,description: ""),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "Palomino Espresso", isFavorite: false,description: ""),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "Upstate", isFavorite: false,description: ""),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "Traif", isFavorite: false,description: ""),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "Graham Avenue Meats And Deli", isFavorite: false,description: ""),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "NewYork", image: "Waffle & Wolf", isFavorite: false,description: ""),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "Five Leaves", isFavorite: false,description: ""),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "Cafe Lore", isFavorite: false,description: ""),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "Confessional", isFavorite: false,description: ""),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "Barrafina", isFavorite: false,description: ""),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "Donostia", isFavorite: false,description: ""),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "Royal Oak", isFavorite: false,description: ""),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "CASK Pub and Kitchen", isFavorite: false,description: "")]
    
    
    // MARK : - List
    var body: some View {
        NavigationView{
            List{
                ForEach(restaurants.indices , id : \.self){index in
                    ZStack{
                    NavigationLink(destination:RestaurantDetailView(restauarant: restaurants[index])){
                        EmptyView()
                    }
                    .opacity(0)
                    VerticalView(restaurant: $restaurants[index])
                        .swipeActions(edge:.trailing , allowsFullSwipe: true , content:{
                            Button{
                                
                            }label: {
                                Image(systemName: "heart")
                            }.tint(.green)
                            Button(){
                                
                            }label: {
                                Image(systemName: "square.and.arrow.up")
                            }.tint(.orange)
                            
                        })
                        .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
                            Button(role:.destructive){
                                restaurants.remove(at: index)
                                
                            }label:{
                                Image(systemName: "trash")
                            }.tint(.red)
                        })
                    }
                    
                }
                .listRowSeparator(.hidden)
            }.listStyle(.plain)
                .navigationTitle("FoodPin")
                .padding()
                .navigationBarTitleDisplayMode(.automatic)
                .accentColor(.white)
        }
//        .navigationBarHidden(true)
        .accentColor(.white)
        
    }
}
// MARK: - Vertical VIEW
struct VerticalView : View{
    //Variables del struct restaurant
    @Binding var restaurant : Restaurant
    
    
    @State private var showOption = false
    @State private var showError = false
    var body : some View {
        VStack(alignment:.leading,spacing: 10){
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height:200)
                .cornerRadius(20)
            VStack(alignment:.leading){
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
            }
            if restaurant.isFavorite{
                Spacer()
                Image(systemName: "heart.fill")
                
                    .foregroundColor(.yellow)
            }
            
        }
        .sheet(isPresented: $showOption){
            let defaultText = "Just cheaking in at \(restaurant.name)"
            if let imageToShare = UIImage(named: restaurant.image){
                ActivityView(acitivyItems: [defaultText,imageToShare])
            }else{
                ActivityView(acitivyItems:[defaultText])
            }
            
        }
        
        .alert(isPresented:$showError){
            Alert(title: Text("No yet avaiable"),
                  message: Text("Sorry , this feature is not available yet. Please reatry later"),
                  primaryButton: .default(Text("OK")),
                  secondaryButton: .cancel()
            )
        }
        .contextMenu{
            Button(action:{
                self.showOption.toggle()
            }){
                HStack{
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
        RestaurantListView().preferredColorScheme(.dark)
    }
}
