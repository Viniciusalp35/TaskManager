//
//  ContentView.swift
//  TaskManager
//
//  Created by user on 20/03/25.
//

import SwiftUI

let PageColor = Color(red: 0.89, green: 0.89, blue: 1)
let componentColor = Color(UIColor.systemIndigo)

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                WeeklyCalendar()
                    .padding([.leading, .trailing], 15)
                Spacer(minLength: 10)
            }.toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button{
                        
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
            .background(PageColor)
        }.padding(.top, 30)
            .background(PageColor)
    }
    
}

#Preview {
    ContentView()
}
