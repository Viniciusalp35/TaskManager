//
//  ContentView.swift
//  TaskManager
//
//  Created by user on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                WeeklyCalendar()
            }
        }.toolbar {
            ToolbarItem(placement: .confirmationAction){
                Button{
                    
                }label: {
                    Label {
                        Text("Adicionar Task")
                    } icon: {
                        
                    }

                }
            }
        }
        }
    }

#Preview {
    ContentView()
}
