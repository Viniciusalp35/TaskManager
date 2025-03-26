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
                                .listRowBackground(Color.clear)
                        }
                    }
                }
                .listRowSpacing(20)
                .scrollContentBackground(.hidden)
                .listSectionSeparator(.hidden)
                .listStyle(InsetGroupedListStyle())
            }.toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button{
                        modelContext.insert(Task(activity: "bla", details: "bla", date: Date().addingTimeInterval(72000), tag: "a", notification: false))
                        modelContext.insert(Task(activity: "bla", details: "bla", date: Date(), tag: "a", notification: false))
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
}

#Preview {
    ContentView()
}
