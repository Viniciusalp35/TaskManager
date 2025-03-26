//
//  SwiftUIView.swift
//  TaskManager
//
//  Created by user on 20/03/25.
//

import SwiftUI

let ComponentColor = Color(UIColor.systemIndigo)

struct WeeklyCalendar: View {
    
    @State var NearestsDays = Date.getWeek
    @State var weekCounter:Int = 0
    @State var Offset:CGSize = CGSize(width: 0, height: 0)
    var DaysOfTheWeek = Calendar.current.shortWeekdaySymbols
    @Binding var selectedDay:Int
    @State var today = Calendar.current.component(.dayOfYear, from: Date())
    var body: some View {
        let month = NearestsDays[3].formatted(.dateTime.month(.wide))
        VStack(alignment: .leading){
            Text("\(month)")
                .font(.title2)
                .fontWeight(.bold)
                .padding([.top,.leading])
            HStack{
                ForEach(DaysOfTheWeek.indices, id: \.self){ index in
                    VStack{
                        Text(DaysOfTheWeek[index])
                            .font(.caption2)
                            .textCase(.uppercase)
                            .fontDesign(.monospaced)
                            .fontWeight(.black)
                            .foregroundColor(.gray)
                            .padding(10)
                            .frame(maxWidth: .infinity)
                        if Calendar.current.component(.dayOfYear,from:NearestsDays[index]) == selectedDay{
                            Text("\(NearestsDays[index].formatted(.dateTime.day()))")
                                .fontWeight(.semibold)
                        }else{
                            Text("\(NearestsDays[index].formatted(.dateTime.day()))")
                        }
                    }.gesture(
                        TapGesture()
                            .onEnded({
                                _ in
                                self.selectedDay = Calendar.current.component(.dayOfYear, from: NearestsDays[index])
                                
                            })
                    )
                    .background(
                        Calendar.current.component(.dayOfYear,from:NearestsDays[index]) == selectedDay ? RoundedRectangle(cornerRadius:14).fill(ComponentColor).opacity(0.40).padding(.bottom, -7) : RoundedRectangle(cornerRadius:14).fill(Color(.gray)).opacity(0).padding(.top,10)
                    )
                }
            }.padding(.bottom, 20)
                .padding([.leading, .trailing], 10)
            .offset(Offset)
            .gesture(
                DragGesture()
                    .onChanged({ Value in
                        self.Offset.width = Value.translation.width
                    })
                    .onEnded({ Value in
                        if Value.translation.width < 0{
                            weekCounter += 1
                            NearestsDays = Date().setNextWeek(weekCounter)
                            self.Offset.width = 0
                        }
                        else{
                            weekCounter -= 1
                            NearestsDays = Date().setNextWeek(weekCounter)
                            self.Offset.width = 0
                        }
                        if getDaysOfYear().contains(where: { day in
                            day == self.today})
                        {
                            self.selectedDay = today
                        }
                        else{
                            self.selectedDay = getDaysOfYear()[1]
                        }
                        
                    })
            )
        }.background(RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color(UIColor.systemBackground)))
    }
    func getDaysOfYear() -> [Int]{
        var daysofyear:[Int] = []
        for i in 0...6{
            daysofyear.append(Calendar.current.component(.dayOfYear, from: NearestsDays[i]))
        }
        return daysofyear
    }
}

#Preview {
    @Previewable @State var selectedday = Calendar.current.component(.dayOfYear, from: Date())
    WeeklyCalendar(selectedDay: $selectedday)
}
