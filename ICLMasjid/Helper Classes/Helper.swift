//
//  Helper.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

// swiftlint:disable line_length

import Adhan
import Firebase
import FirebaseDatabase
import FirebaseUI
import Foundation
import UIKit

class Helper {
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!

  static var app: Helper = {
    Helper()
  }()

  func dateFormatter(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    let now = date
    let dateString = formatter.string(from: now)
    return dateString
  }

  func datetoString(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy" // Your New Date format as per requirement change it own
    let newDate = dateFormatter.string(from: date)
    return newDate
  }

  func daysLeftforRamadan(ramadanDate: String) -> String {
    var daysLeftMessage: String = ""
    let futureDate = ramadanDate
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let formatedStartDate = dateFormatter.date(from: futureDate)
    let currentDate = Date()
    let differenceOfDate = Calendar.current.dateComponents([.day], from: currentDate, to: formatedStartDate!).day!

    if differenceOfDate <= 0 {
      daysLeftMessage = " Ramadan is here. Best time to supplicate is now"
    } else {
      daysLeftMessage = " Ramadan will start in \(differenceOfDate) days "
    }
    return daysLeftMessage
  }

  func prayerTimes() -> SalatTimings {
    let cal = Calendar(identifier: Calendar.Identifier.gregorian)
    let date = cal.dateComponents([.year, .month, .day], from: Date())
    let coordinates = Coordinates(latitude: 33.448376, longitude: -112.074036)
    var params = CalculationMethod.karachi.params
    var salathTimes: SalatTimings = SalatTimings(fazar: "", sunrise: "", zohar: "", asar: "", magrib: "", isha: "")
    params.madhab = .hanafi
    if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
      let formatter = DateFormatter()
      formatter.timeStyle = .short
      formatter.timeZone = TimeZone(identifier: "America/Phoenix")!
      salathTimes = SalatTimings(fazar: formatter.string(from: prayers.fajr), sunrise: formatter.string(from: prayers.sunrise), zohar: formatter.string(from: prayers.dhuhr), asar: formatter.string(from: prayers.asr), magrib: formatter.string(from: prayers.maghrib), isha: formatter.string(from: prayers.isha))
    }
    return salathTimes
  }

  func prayerTimes() -> [String] {
    let cal = Calendar(identifier: Calendar.Identifier.gregorian)
    let date = cal.dateComponents([.year, .month, .day], from: Date())
    let coordinates = Coordinates(latitude: 33.448376, longitude: -112.074036)
    var params = CalculationMethod.northAmerica.params
    var salathTimes: [String] = []
    params.madhab = .shafi
    if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
      let formatter = DateFormatter()
      formatter.timeStyle = .short
      formatter.timeZone = TimeZone(identifier: "America/Phoenix")!
      salathTimes.append(formatter.string(from: prayers.fajr))
      salathTimes.append(formatter.string(from: prayers.sunrise))
      salathTimes.append(formatter.string(from: prayers.dhuhr))
      salathTimes.append(formatter.string(from: prayers.asr))
      salathTimes.append(formatter.string(from: prayers.maghrib))
      salathTimes.append(formatter.string(from: prayers.isha))
    }
    return salathTimes
  }

  func stringToHtml(htmlTest: String) -> NSAttributedString {
    let htmlString = htmlTest
    let data = htmlString.data(using: String.Encoding.unicode)!
    let attrStr = try? NSAttributedString(
      data: data,
      options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
      documentAttributes: nil
    )
    return attrStr!
  }

  func calculateRamadaMonthPrayerTimes(ramadanStartDate: String) -> [RamadanSalatTimings] {
    var initalDate: String = ramadanStartDate
    var ramadaPrayerTimes = [RamadanSalatTimings]()

    // date format should be 25 03 2019

    for _ in 0 ... 29 {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd MM yyyy"
      let myDate = dateFormatter.date(from: "\(initalDate)")!
      let cal = Calendar(identifier: Calendar.Identifier.gregorian)
      let date = cal.dateComponents([.year, .month, .day], from: myDate)
      let coordinates = Coordinates(latitude: 33.448376, longitude: -112.074036)
      var params = CalculationMethod.karachi.params
      params.madhab = .hanafi
      var fazar: String = " "
      var sunrise: String = " "
      var johar: String = " "
      var asar: String = " "
      var magrib: String = " "
      var isha: String = " "
      if let prayers = PrayerTimes(coordinates: coordinates, date: date, calculationParameters: params) {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.timeZone = TimeZone(identifier: "America/Phoenix")!
        fazar = formatter.string(from: prayers.fajr)
        sunrise = formatter.string(from: prayers.sunrise)
        johar = formatter.string(from: prayers.dhuhr)
        asar = formatter.string(from: prayers.asr)
        magrib = formatter.string(from: prayers.maghrib)
        isha = formatter.string(from: prayers.isha)
      }

      let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: myDate)
      let somedateString = dateFormatter.string(from: tomorrow!)

      let dateFormatterDisplay = DateFormatter()
      dateFormatterDisplay.dateFormat = "MMM d, EEEE"

      let day: String = dateFormatterDisplay.string(from: myDate)
      let ramadanCurrentDay = RamadanSalatTimings(day: "\(day)", fazar: "\(fazar)", sunrise: "\(sunrise)", zohar: "\(johar)", asar: "\(asar)", magrib: "\(magrib)", isha: "\(isha)")
      ramadaPrayerTimes.append(ramadanCurrentDay)
      initalDate = somedateString
    }

    return ramadaPrayerTimes
  }

  func superscriptStr(text: String, location: Int) -> NSAttributedString {
    let fnt = Font.xlarge01
    let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: fnt])
    attributedString.setAttributes([NSAttributedString.Key.font: fnt.withSize(10), NSAttributedString.Key.baselineOffset: 2], range: NSRange(location: location, length: 1))
    return attributedString
  }
}
