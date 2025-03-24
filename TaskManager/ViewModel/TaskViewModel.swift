//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by User on 24/03/25.
//
import SwiftData
import Foundation

@MainActor
class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private var modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
//
//    func fetchTasks() {
//        do {
//            let descriptor = FetchDescriptor<Task>(sortBy: [SortDescriptor(\.dueDate)])
//            tasks = try modelContext.fetch(descriptor)
//        } catch {
//            print("Error fetching tasks: \(error)")
//        }
//    }
//
//    func addTask(title: String, description: String, dueDate: Date, tags: String) {
//        let newTask = Task(title: title, taskDescription: description, dueDate: dueDate, tags: tags)
//        modelContext.insert(newTask)
//        saveContext()
//    }
//
//    func updateTask(task: Task, title: String, description: String, dueDate: Date, tags: String) {
//        task.title = title
//        task.taskDescription = description
//        task.dueDate = dueDate
//        task.tags = tags
//        saveContext()
//    }
//
//    func deleteTask(task: Task) {
//        modelContext.delete(task)
//        saveContext()
//    }
//
//    func toggleTaskCompletion(task: Task) {
//        task.isCompleted.toggle()
//        saveContext()
//    }
//
//    private func saveContext() {
//        do {
//            try modelContext.save()
//            fetchTasks()
//        } catch {
//            print("Error saving context: \(error)")
//        }
//    }
}
