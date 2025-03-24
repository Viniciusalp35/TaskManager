//
//  TagModel.swift
//  TaskManager
//
//  Created by User on 24/03/25.
//

import SwiftData
import SwiftUICore
import Foundation

@Model
final class TagModel {
    var name: String
    var color: [Float]
    var symbol: String
    init(name: String, color: [Float], symbol: String) {
        self.name = name
        self.color = color
        self.symbol = symbol
    }
}
