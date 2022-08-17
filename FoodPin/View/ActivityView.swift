//
//  ActivityView.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 15/08/22.
//

//import Foundation
import SwiftUI

struct ActivityView : UIViewControllerRepresentable{
    var acitivyItems : [Any]
    var applicationActivities : [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let activityControllers = UIActivityViewController(activityItems: acitivyItems, applicationActivities: applicationActivities)
            return activityControllers
        }
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    }
    
    
    

