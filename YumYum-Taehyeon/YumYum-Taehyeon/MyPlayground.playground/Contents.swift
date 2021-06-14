import Cocoa

let calendar = Calendar(identifier: .gregorian)
let now = Date()
var myDate = DateComponents()

myDate.year = calendar.component(.year, from: now)
myDate.month = calendar.component(.month, from: now)
myDate.day = 1

let numbersOfDaysInMonth = calendar.range(of: .day,
                                          in: .month,
                                          for: calendar.date(from: myDate)!)?.count

let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: now))

let firstDayOfWeek = calendar.component(.weekday,
                                        from: firstDayOfMonth!)
