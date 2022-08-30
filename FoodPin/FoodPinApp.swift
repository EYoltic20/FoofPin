//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 31/05/22.
//

import SwiftUI

@main
struct FoodPinApp: App {
    init(){
        let navBarApparence = UINavigationBarAppearance()
        navBarApparence.largeTitleTextAttributes = [.foregroundColor:UIColor.systemRed,.font:UIFont(name:"Arial",size:35)!]
        navBarApparence.titleTextAttributes = [.foregroundColor:UIColor.systemRed,.font:UIFont(name:"Arial",size:25)]
        navBarApparence.backgroundColor = .clear
        navBarApparence.backgroundEffect = .none
        navBarApparence.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navBarApparence
        UINavigationBar.appearance().scrollEdgeAppearance = navBarApparence
        UINavigationBar.appearance().compactAppearance = navBarApparence
        
    }
    var body: some Scene {

        WindowGroup {
            RestaurantListView().preferredColorScheme(.dark)
        }
    }
}
