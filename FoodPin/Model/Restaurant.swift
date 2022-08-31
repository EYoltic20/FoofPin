//
//  Restaurant.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 13/06/22.
//

import Foundation
struct Restaurant{
    var name: String
    var type: String
    var location : String
    var description : String
    var image :String
    var isFavorite : Bool
    
    init(name :String,type:String , location:String,image:String,isFavorite:Bool,description:String){
        self.name = name
        self.type = type
        self.description = description
        self.location=location
        self.image = image
        self.isFavorite = isFavorite
    }
    init(){
        self.init(name:"",type:"",location:"",image:"",isFavorite: false,description: "")
    }
    enum Rating : String , CaseIterable{
        case awesome
        case good
        case okay
        case bad
        case terrible
        var image: String{
            switch self {
            case .awesome:
                return "love"
            case .good:
                return "cool"
            case .okay:
                return "happy"
            case .bad:
                return"sad"
            case .terrible:
                return "angry"
            }
        }
    }
}
