//
//  UIFontExtensions.swift
//  Sofascore2025App
//
//  Created by Petar Majić on 24.03.2025..
//

import UIKit

extension UIFont {
    static var robotoBold: UIFont {
        return UIFont(name: "Roboto-Bold", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .bold)
    }
    
    static var robotoLight12: UIFont {
           return UIFont(name: "Roboto-Light", size: 12) ?? UIFont.systemFont(ofSize: 12, weight: .light)
       }

       static var robotoLight14: UIFont {
           return UIFont(name: "Roboto-Light", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .light)
       }
}
