//
//  GlobalData.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//
// swiftlint:disable line_length

import Foundation
import UIKit

struct GlobalData {
  static let backgroundColor: UIColor = UIColor(displayP3Red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
  static let skyBlueColor: UIColor = UIColor(displayP3Red: 64 / 255, green: 152 / 255, blue: 197 / 255, alpha: 1)
  static let darkBlueColor: UIColor = UIColor(displayP3Red: 0 / 255, green: 23 / 255, blue: 90 / 255, alpha: 1)
  static let greenColor: UIColor = UIColor(displayP3Red: 93 / 255, green: 189 / 255, blue: 132 / 255, alpha: 1)
  static let creamRedColor: UIColor = UIColor(displayP3Red: 224 / 255, green: 106 / 255, blue: 88 / 255, alpha: 1)
  static let lightBlue: UIColor = UIColor(displayP3Red: 1 / 255, green: 21 / 255, blue: 63 / 255, alpha: 1)
  static let navigationMainColor: UIColor = UIColor(displayP3Red: 84 / 255, green: 13 / 255, blue: 110 / 255, alpha: 1)
  static let lightGray: UIColor = UIColor(displayP3Red: 239 / 255, green: 240 / 255, blue: 241 / 255, alpha: 1)
  static let darkOrange: UIColor = UIColor(displayP3Red: 233 / 255, green: 114 / 255, blue: 76 / 255, alpha: 1)

  static let segmentData = ["Prayer Time", "Iqama Time", "Juma Time"]
  static let prayerTimeNames = ["Fazar", "Sunrise", "Duhar", "Asar", "Magrib", "Isha'a"]
  static let iqamaTimeNames = ["Fazar", "Duhar", "Asar", "Magrib", "Isha'a"]
  static let JumaTimeNames = ["Friday Khutba:", "Prayers:"]
  static let JuneTime = ["Starts at 1:00 PM", "1:30 PM"]
  static let salatImages = ["subah-prayer", "ramadan-sunrise", "zuhar-prayer", "ramadn-azhar", "maghrib-prayer", "isha-prayer"]
  static let IqamaImages = ["subah-prayer", "zuhar-prayer", "ramadn-azhar", "maghrib-prayer", "isha-prayer"]
  static let jumaImages = ["adhan-call", "islamic-pray"]
  static let iclMasjidMappAddress = "5099 W Dobbins Rd, Laveen, AZ 85339"
  static let iclMasjidAddress = " <u>Masjid Address: </u></br>Islamic Center of Laveen (ICL)</br>5099 W Dobbins Rd</br> Laveen, AZ 85339 </br>Ph: 602-237-2666"

  static let masjidDetailsCellContents = [MasjidDetailsCellContent(masjidDetailsCellLable: "Majid Location", masjidDetailsCellImage: "map"),
                                          MasjidDetailsCellContent(masjidDetailsCellLable: "About Us", masjidDetailsCellImage: "about"),
                                          MasjidDetailsCellContent(masjidDetailsCellLable: "Events & Activities", masjidDetailsCellImage: "events"),
                                          MasjidDetailsCellContent(masjidDetailsCellLable: "NAQ School", masjidDetailsCellImage: "school-1"),
                                          MasjidDetailsCellContent(masjidDetailsCellLable: "Ramadan", masjidDetailsCellImage: "ramadan"),
                                          MasjidDetailsCellContent(masjidDetailsCellLable: "View More", masjidDetailsCellImage: "more")]
  static let aboutUSlist = ["ICL Mission and Goals", "ICL Organizantion", "501(c)(3) Tax Exempt", "ICL project", "Donations to Masjid"]
  static let aboutUSiamge = ["goals", "organization", "tax", "construction", "donate"]
  static let goalsDescriptionText = "<b><u>ICL - A Non-profit Organization:</b></u></br></br>ICL is an independent, non-profit, religious organization. ICL mission is to help and assist Muslims in our community as well as Muslims in the USA to preserve their religious heritage and customs. ICL members shall contribute peacefully and democratically to the diversity and pluralism of the American society.</br></br><b><u>Support Your Masjid: </u></b></br></br>As ICL Project of building a new Masjid is still in the process, the ICL Board would like to request every single community member to support your Masjid and donate generously. You can send us a check, donate using credit card or online by clicking the link below</br>"
  static let donationFormsList = ["CASH App paid to 602-237-2666", "VENMO App paid to 602-237-2666", "ZELLE paid to 602-237-2666", "PayPal paid to 602-237-2666"]
  static let donationFormsImages = ["cashAPP", "venmo", "zelle", "paypal"]
  static let taxExemptText = "<b>The Islamic Center of Laveen (ICL) is IRS approved 501(c)(3) tax exempt, non-profit, religious organization.</b></br></br><b><u>501(c)(3) And What It Means:</u></b></br></br>501(c)(3) is the section of the Internal Revenue Code that refers to Islamic Center of Laveen (ICL). Section 501 refers to tax exempt organizations, sub-section (c) is a list of many different categories of exempt organizations, and sub-section (3) is the category of exempt organizations that includes Islamic Centers, Churches and various other religious and charitable organizations.</br></br>A 501(c)(3) organization is a tax-exempt organization that has met the IRS criteria, and is eligible to receive tax-deductible donations from various sources.</br></br>The IRS informs an organization that it is exempt under Section 501(c)(3) by sending it a Determination Letter to that effect.</br></br>Once an organization is exempt, it is required to file an annual information return with the IRS form 990. However, in certain scenarios, the form is optional.</br></br><b><u>Benefits of 501(c)(3):</u></b></br></br>There are benefits with respect to limiting individual liability, obtaining sales tax and property tax exemptions, and most important -- fundraising. Many individuals and corporations will not donate to an organization unless it has 501(c)(3) status, which allows a donor to take an income tax deduction for the donation.</br></br><b><u>ICL Request And Donations:</u></b></br></br>All donations that are made either by check, credit card or online are tax-deductible. Please donate generosly."
  static let NAQschoolHeaderText = "<u>Islamic Center of Laveen (ICL) - Noor Al-Quran (NAQ):</u></br></br>The Islamic Center of Laveen (ICL) has been offering Noor Al-Quran (NAQ) Educational Services to our community members. Alhamdulillah, ICL offers two different programs that have been very successful. ICL strives to provide exceptional educational services to our community members. That is the reason ICL offers the following different options to serve better and to provide the knowledge that our next generation is in need for.</br></br>Please click for more information or alternately, please contact <u>Syed Mansoor Hussain</u> if there is any question regarding the programs."

  static let eventAndActivities = ["Upcoming Events", "Islamic Dates", "Volunteer Registration"]
  static let eventAndActivitiesImages = ["events-1", "dates", "register"]
  static let pdfFormsNames = ["NAQHifzProgram-RegistrationForm", "NAQHifzProgram-AuthorizationForm", "NAQSundaySchool-RegistrationForm", "NAQSundaySchool-AuthorizationForm"]
  static let pdfFormsList = ["NAQ Hifz Program - Registration Form", "NAQ Hifz Program - Authorization Form", "NAQ Sunday School - Registration Form", "NAQ Sunday School - Authorization Form"]
  static let ramadanView = ["Ramadan Schedule", "Zakat Calculator", "Ramadan Checklist"]
  static let ramadanViewImages = ["ramadan-1", "donate", "checklist"]
  static let zakatFormFileds = ["Value of total GOLD", "Value of total SILVER", "CASH in Hand", "CASH in Bank Account",
                                "CASH in Business", "Rental Income", "Property Value", "Stocks Value", "Debts to Family Value", "Debts to Others Value",
                                "Credit card payments", "Home Payments", "Car payments", "Business payments"]
  static let zakatSectioNames = ["Gold & Silver", "Cash & Property", "Debts & Liabilities"]

  static let daily = ["Wake up for Suhoor", "Pray Sunnah prayers", "Pray Taraweeh at the masjid", "Read the Qur’an", "Understand the translation", "Make Dua and Dhikr", "Do Istighfar", "Do Sadaqa", "Help someone in need"]
  static let weekly = ["Visit the Elderly/Sick", "Feed the less fortunate", "Participate in Sermons", "Memorize a Surah", "Learn new Duas"]
  static let monthly = ["Finish the Qur’an", "Give Zakat", "Do Dawah", "Mend Relationships", "Become a better muslim", "Give fitra before Eid Prayer"]
  static let viewMoreList = ["Register with US", "Feedback or Comments", "Donations to Masjid"]
  static let viewMoreImages = ["register", "message", "donate"]
}
