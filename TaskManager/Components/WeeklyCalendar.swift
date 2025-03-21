//
//  SwiftUIView.swift
//  TaskManager
//
//  Created by user on 20/03/25.
//

import SwiftUI

struct WeeklyCalendar: View {
    
    @State var NearestsDays = Date.getWeek
    var DaysOfTheWeek = Calendar.current.shortWeekdaySymbols
    let day = Calendar.current.component(.day, from: Date())
    var today = Calendar.current.component(.weekday, from: Date()) - 1
    var body: some View {
        VStack{
            let month = Date().formatted(.dateTime.month(.wide).year(.defaultDigits))
            Text("\(month)")
            HStack{
                
                ForEach(DaysOfTheWeek.indices, id: \.self){ index in
                    VStack{
                        Text(DaysOfTheWeek[index])
                            .font(.system(size: 10))
                            .textCase(.uppercase)
                            .fontDesign(.monospaced)
                            .fontWeight(.black)
                            .foregroundColor(.gray)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                        if index == today{
                            Text("\(NearestsDays[index].formatted(.dateTime.day()))")
                                .fontWeight(.semibold)
                        }else{
                            Text("\(NearestsDays[index].formatted(.dateTime.day()))")
                        }
                    }.background(
                        index == today ? RoundedRectangle(cornerRadius:21).fill(Color(.lightGray)).opacity(0.65).padding(.bottom, -7) : RoundedRectangle(cornerRadius:21).fill(Color(.gray)).opacity(0).padding(.top,10)
                    )
                }
            }
        }
    }

}

#Preview {
    WeeklyCalendar()
}
