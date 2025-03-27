//
//  TagModel.swift
//  TaskManager
//
//  Created by User on 24/03/25.
//

import SwiftData
import SwiftUI
import Foundation

@Model
final class TagModel {
    var name: String
    var color: [Double]
    var symbol: String
    
    init(name: String, color: [Double], symbol: String) {
        self.name = name
        self.color = color
        self.symbol = symbol
    }
    
    func getColor() -> Color {
        return Color(red: color[0], green: color[1], blue: color[2])
    }
}
