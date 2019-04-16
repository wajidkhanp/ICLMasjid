//
//  DataModels.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/28/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Foundation

struct SalatTimings {
  var fazar: String?
  var sunrise: String?
  var zohar: String?
  var asar: String?
  var magrib: String?
  var isha: String?

  init(fazar: String?, sunrise: String?, zohar: String?, asar: String?, magrib: String?, isha: String?) {
    self.fazar = fazar
    self.sunrise = sunrise
    self.zohar = zohar
    self.asar = asar
    self.magrib = magrib
    self.isha = isha
  }
}

struct MasjidDetailsCellContent {
  let masjidDetailsCellLable: String?
  let masjidDetailsCellImage: String?
}

struct MemberModle {
  var name: String?
  var position: String?
  var contact: String?

  init(name: String?, position: String?, contact: String?) {
    self.name = name
    self.position = position
    self.contact = contact
  }
}

struct IslamicDates {
  var date: String?
  var event: String?
  var islamicDay: String?

  init(date: String?, event: String?, islamicDay: String?) {
    self.date = date
    self.event = event
    self.islamicDay = islamicDay
  }
}

struct MasjidEvents {
  var date: String?
  var eventName: String?
  var eventDes: String?

  init(date: String?, eventName: String?, eventDes: String?) {
    self.date = date
    self.eventName = eventName
    self.eventDes = eventDes
  }
}

struct MasjidMembers {
  var fName: String?
  var lName: String?
  var email: String?
  var phone: String?

  init(fName: String?, lName: String?, email: String?, phone: String?) {
    self.fName = fName
    self.lName = lName
    self.email = email
    self.phone = phone
  }
}

struct ZakatInput {
  static var details: ZakatInput = ZakatInput()
  var gold: Double = 0.0
  var silver: Double = 0.0
  var cashinhand: Double = 0.0
  var cashinbank: Double = 0.0
  var cashinbusiness: Double = 0.0
  var rentalincome: Double = 0.0
  var propertvalue: Double = 0.0
  var stockvalue: Double = 0.0
  var debtstofamily: Double = 0.0
  var debtstoothers: Double = 0.0
  var creditcardpayments: Double = 0.0
  var homepayment: Double = 0.0
  var carpayment: Double = 0.0
  var businesspayment: Double = 0.0
}

struct RamadanSalatTimings {
  var day: String?
  var fazar: String?
  var sunrise: String?
  var zohar: String?
  var asar: String?
  var magrib: String?
  var isha: String?

  init(day: String?, fazar: String?, sunrise: String?, zohar: String?, asar: String?, magrib: String?, isha: String?) {
    self.day = day
    self.fazar = fazar
    self.sunrise = sunrise
    self.zohar = zohar
    self.asar = asar
    self.magrib = magrib
    self.isha = isha
  }
}
