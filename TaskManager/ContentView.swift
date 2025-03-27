//
//  ContentView.swift
//  TaskManager
//
//  Created by user on 20/03/25.
//

import SwiftUI
import SwiftData



let componentColor = Color(UIColor.systemIndigo)

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var modelContext
    @State var addTask: Bool = false
    
    @Query(sort:\Task.date, order: .forward) var Models:[Task]
    
    @State var selectedDay = Calendar.current.component(.dayOfYear, from: Date())
    
//    var Models:[Task] = [
//        Task(activity: "Criar identidade visual", details: "oi", date: Date().addingTimeInterval(46800), tag: "auuu", notification: false),
//        Task(activity: "Criar identidade visual", details: "oi", date: Date(), tag: "auuu", notification: false),
//        Task(activity: "Criar identidade visual", details: "oi", date: Date(), tag: "auuu", notification: false),
//        Task(activity: "Criar identidade visual", details: "oi", date: Date(), tag: "auuu", notification: false),
//        Task(activity: "Criar identidade visual", details: "oi", date: Date(), tag: "auuu", notification: false)
//    ]

    var body: some View {
        NavigationStack{
            VStack() {
                WeeklyCalendar(selectedDay: $selectedDay)
                    .padding([.leading, .trailing], 15)
                Spacer(minLength: 20)
                List{
                    ForEach(Models){
                        model in
                        if Calendar.current.component(.dayOfYear, from: model.date) == selectedDay{
                            ListTask(model: model)
                                .swipeActions{
                                    deleteTask(model)
                                }
                                .frame(maxWidth: .infinity)
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listRowSpacing(10)
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .sheet(isPresented: $addTask) {
                    AddTaskView()
                }
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button{
                        addTask.toggle()
                    }label: {
                        Label {
                            Text("Adicionar Task")
                        } icon: {
                            Image(systemName: "plus").foregroundStyle(componentColor,componentColor,componentColor)
                        }
                        
                    }.labelStyle(.iconOnly)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text("Agenda")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                }
                
            }.padding(.top, 25)
            .toolbarTitleDisplayMode(.inline)
            .background(darkMode())
        }.padding(.top, 30)
            .background(darkMode())
    }
    func darkMode() ->Color{
        if colorScheme == .dark{
            return Color(red: 0.14, green: 0.13, blue: 0.17)
        }
        else{
            return Color(red: 0.89, green: 0.89, blue: 1)
        }
    }
    
    func deleteTask(_ Task:Task) -> some View{
        Button(role: .destructive){
            modelContext.delete(Task)
//            Tasks.removeAll{
//                currentTask in currentTask.id == Task.id
//            }
        } label: {
            Label{
                Text("Delete")
            }icon: {
                Image(systemName: "trash")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Task.self, TagModel.self], inMemory: true)
}
