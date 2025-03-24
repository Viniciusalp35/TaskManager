//
//  DateExtension.swift
//  TaskManager
//
//  Created by user on 20/03/25.
//

import Foundation

extension Date {
//    static var getNearestsDays:[Date]{
//        let baseDate = Date()
//        var NearestsDays:[Date] = []
//        for i in -3...3{
//            if let TobeAppended = Calendar.current.date(byAdding: .day, value: i, to: baseDate){
//                NearestsDays.append(TobeAppended)
//            }
//        }
//        return NearestsDays
//    }
    
    static var getWeek:[Date]{
        let today = Date()
        var Week:[Date] = []
        let WeekOfYear = Calendar.current.component(.weekOfYear, from: today)
        let weekDay = Calendar.current.component(.weekday, from: today)
        let DayOfYear = Calendar.current.component(.dayOfYear, from: today)
        let year = Calendar.current.component(.year, from: today)
        let StartOfWeek = DayOfYear - weekDay + 1
        
        if let day = Calendar.current.date(from: DateComponents(year: year,day: StartOfWeek,weekOfYear: WeekOfYear)){
            for i in 0...6{
                if let nextday = Calendar.current.date(byAdding: .day, value: i, to: day){
                    Week.append(nextday)
                }
            }
        }
        return Week
    }
    
    func setNextWeek(_ value: Int) -> [Date]{
        let week = Date.getWeek
        var newWeek:[Date] = []
        for index in 0...6{
            if let nextWeek = Calendar.current.date(byAdding: .dayOfYear, value: 7*value, to: week[index]){
                newWeek.append(nextWeek)
            }
        }
        return newWeek
    }
    
//    static var getWeekdays:[Int]{
//        let baseDates = Date.getNearestsDays
//        var weekdays:[Int] = []
//        for i in 0...6{
//            weekdays.append(Calendar.current.component(.weekday, from: baseDates[i]))
//        }
//        return weekdays
//    }
    
//    static var getCurrentWeek:[Date] {
//        let currentDate = Date()
//        let weekDates: [Date] = []
//        let currentDate =  Calendar.current.component(.weekday, from: currentDate)
//        return weekDates
//    }
}


