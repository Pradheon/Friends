//
//  ColorThemeStyle.swift
//  Friends
//
//  Created by Joshan Rai on 4/5/22.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.261, green: 0.261, blue: 0.261)
    }
    
    static var steel: Color {
        Color(red: 0.476, green: 0.476, blue: 0.476)
    }
    
    static var aluminum: Color {
        Color(red: 0.664, green: 0.664, blue: 0.664)
    }
    
    static var accentYellowLight: Color {
        Color(red: 1.000, green: 0.777, blue: 0.000)
    }
    
    static var accentYellowDark: Color {
        Color(red: 0.896, green: 0.615, blue: 0.060)
    }
}
