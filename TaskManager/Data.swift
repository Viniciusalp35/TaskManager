//
//  Data.swift
//  TaskManager
//
//  Created by User Bianca Moreira on 21/03/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Task.dueDate, animation: .default) private var tasks: [Task]
    @State private var showingAddTaskView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(tasks) { task in
                    TaskRow(task: task, modelContext: modelContext)
                }
                .onDelete(perform: deleteTasks)
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddTaskView.toggle() }) {
                        Label("Add Task", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddTaskView) {
                AddTaskView()
            }
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}

struct TaskRow: View {
    var task: Task
    var modelContext: ModelContext

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title).font(.headline)
                Text(task.taskDescription).font(.subheadline)
            }
            Spacer()
            Button(action: {
                task.isCompleted.toggle()
                try? modelContext.save()
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let newTask = Task(title: title, taskDescription: description, dueDate: dueDate, tags: tags)
                        modelContext.insert(newTask)
                        dismiss()
                    }
                }
            }
        }
    }
}

