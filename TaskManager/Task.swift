//
//  Task.swift
//  TaskManager
//
//  Created by User Bianca Moreira on 21/03/25.
//

import SwiftData
import Foundation

@Model
final class Task {
    var id: UUID
    var title: String
    var taskDescription: String
    var dueDate: Date
    var tags: String
    var isCompleted: Bool

    init(id: UUID = UUID(), title: String, taskDescription: String, dueDate: Date, tags: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.taskDescription = taskDescription
        self.dueDate = dueDate
        self.tags = tags
        self.isCompleted = isCompleted
    }
}

@Model
final class UserProgress {
    var points: Int

    init(points: Int = 0) {
        self.points = points
    }
}
  
