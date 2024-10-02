//
//  DateExtension.swift
//  HIIFit
//
//  Created by Ryan Westhoelter on 9/12/24.
//

import Foundation

extension Date {
  
  func formatted(as format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }

  var yearMonthDay: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy MM dd"
    return dateFormatter.string(from: self)
  }

  func isSameDay(as day: Date) -> Bool {
    return self.yearMonthDay == day.yearMonthDay
  }

  var dayName: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: self)
  }
    
    var previousSevenDays: [Date] {
        (-6...0).map { day in
            Calendar.current.date(
                byAdding: .day,
                value: day,
                to: self) ?? Date()
        }
    }
}
