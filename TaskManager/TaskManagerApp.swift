//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by user on 20/03/25.
//

import SwiftUI
import SwiftData

@main
struct TimeManagementApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Task.self]) // Configura o container do SwiftData para o modelo Task
    }
}
