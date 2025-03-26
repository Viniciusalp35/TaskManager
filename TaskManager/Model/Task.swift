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
    var DayofYear: Int
    var tag: String
    var notification: Bool

    init(activity: String, details: String, date: Date, tag: String, notification: Bool) {
        self.activity = activity
        self.details = details
        self.date = date
        self.tag = tag
        self.notification = notification
        self.DayofYear = Calendar.current.component(.dayOfYear, from: date)
    }
}
