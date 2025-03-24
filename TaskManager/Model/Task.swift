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
    var activity: String
    var details: String
    var date: Date
    var tag: String
    var notification: Bool

    init(activity: String, details: String, date: Date, tag: String, notification: Bool) {
        self.activity = activity
        self.details = details
        self.date = date
        self.tag = tag
        self.notification = notification
    }
}

@Model
final class UserProgress {
    var points: Int

    init(points: Int = 0) {
        self.points = points
    }
}
