//
//  ColorExtension.swift
//  FoodPin
//
//  Created by Emilio Y Martinez on 29/08/22.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(red:Int , green: Int , blue : Int){
        let redValue = CGFloat(red)/255
        let greenValue = CGFloat(green)/255
        let blueValue = CGFloat(blue)/255
        self.init(red:redValue,green:greenValue,blue:blueValue,alpha:1.0)
    }
}
