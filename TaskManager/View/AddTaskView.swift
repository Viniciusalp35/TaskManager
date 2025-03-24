//
//  AddTaskView.swift
//  TaskManager
//
//  Created by User on 24/03/25.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate: Date = Date()
    @State private var tags: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                TextField("Tags", text: $tags)
            }
            .navigationTitle("Add Task")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button("Save") {
//                        let newTask = Task(title: title, taskDescription: description, dueDate: dueDate, tags: tags)
//                        modelContext.insert(newTask)
//                        dismiss()
//                    }
//                }
//            }
        }
    }
}
