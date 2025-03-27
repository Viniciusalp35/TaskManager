//
//  ListTask.swift
//  TaskManager
//
//  Created by user on 24/03/25.
//

import SwiftUI


struct ListTask: View {
    let componentColor = Color(UIColor.systemIndigo)
    var model:Task
    var body: some View {
        VStack(alignment: .leading){
//            LABEL AND NOTIFICATION BUTTON
            HStack(alignment: .center){
                Text("\(model.activity)")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button{
                    
                }label: {
                    Label {
                        Text("Task Label")
                    } icon: {
                        Image(systemName: "bell.fill").foregroundStyle(.white,.white,.white)
                            .padding(.all, 4.5)
                            .background(Circle()
                                .fill(componentColor))}
    
                }.labelStyle(.iconOnly)
            }.padding(.bottom, 10)
//            date
            Text("\(model.date.formatted(.dateTime.day(.twoDigits).month(.twoDigits).year(.defaultDigits)))")
                .padding(.bottom, 10)
//             HOUR AND TAG
            HStack{
                Text("\(model.date.formatted(.dateTime.hour(.twoDigits(amPM: .omitted)).minute(.twoDigits)))")
                Spacer()
//                TagView()
            }
        }
        .padding(.all, 10)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(UIColor.systemBackground))
        )
    }
}

#Preview {
    ListTask(model: Task(activity: "Cirar identidade visual", details: "oi", date: Date(), tag: "auuu", notification: false))
}
