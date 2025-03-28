//
//  NewTagView.swift
//  TaskManager
//
//  Created by User on 27/03/25.
//

import SwiftUI
import SwiftData

struct NewTagView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State var taskName: String = ""
    @State var taskDetails: String = ""
    @State var taskDate: Date = Date()
    @State var taskTag: String = ""
    @State var notification: Bool = false
       
    let tags: [TagModel] = [
        TagModel(name: "Tag 1", color: [255, 149, 0], symbol: "tag.fill"),
        TagModel(name: "Tag 2", color: [0, 255, 81], symbol: "flame.fill")
    ]
    
    @State private var selectedTag: TagModel = TagModel(name: "", color: [], symbol: "")
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    HStack {
                        Text("Tarefa")
                            .frame(
                                minWidth: 50,
                                maxWidth: 100,
                                alignment: .leading
                            )
                        TextField("Insira o nome da tarefa", text: $taskName)
                    }
                    
                    HStack {
                        Text("Descrição")
                            .frame(
                                minWidth: 50,
                                maxWidth: 100,
                                alignment: .leading
                            )
                        TextField("Insira o nome da Descrisão", text: $taskDetails)
                    }
                    
                    
                }
                
                Section {
                    DatePicker("Data", selection:
                                $taskDate)
                }
                Section{
//                    TextField("Task Tag", text: $taskTag)
                    if tags.isEmpty == false {
                        Picker(
                            "Tag",
                            selection: $selectedTag
                        ) {
                            ForEach(tags, id: \.self) { tag in
                                Text(tag.name)
                            }
                        }
                        .pickerStyle(.automatic)
                        .onAppear {
                            selectedTag = tags[0]
                        }
                    }
                    Button("Adicionar tag") {
                        // TODO: Adicionar nova tela para criar tag
                    }
                    
                }
                .listRowSeparator(.hidden)
                
                Toggle("Notification", isOn: $notification)
            }
            .scrollContentBackground(.hidden)
            .background(Color("Pink"))
        

            .toolbar {
                ToolbarItem(placement:
                        .confirmationAction) {
                            Button {
                                let newTask = Task(
                                    activity: taskName, details: taskDetails, date: taskDate, tag: taskTag, notification: notification
                                )
                                modelContext.insert(newTask)
                                dismiss()
                            } label: {
                                Text("Salvar")
                            }
                        }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Voltar")
                    }
                }
            }
            .navigationTitle("Nova tag")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}


#Preview {
    NewTagView()
}

