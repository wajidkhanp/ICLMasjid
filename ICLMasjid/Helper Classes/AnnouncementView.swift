//
//  AnnouncementView.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/31/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
// swiftlint:disable line_length

class AnnouncementView: UIView {
  lazy var announcementLabel: UILabel = Components.subHeadingLabel(text: "Announcements:")
  lazy var eventname: UILabel = Components.subHeadingLabel(text: "Friday Night Halaqa")
  lazy var eventDeatils: UILabel = Components.subHeadingLabel(text: "ICL provides weekly Halaqa gathering on every Friday after Maghrib prayers. Our great imam/scholars provide information from Quran and Sunnah which is very beneficial for the families who attend. The food is also provided by the families who attend the Halaqa.  The Halaqa gathering and potluck is a great way to stay connected in our community. ")

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupUI() {
    addSubview(announcementLabel)
    addSubview(eventname)
    addSubview(eventDeatils)

    announcementLabel.attributedText = "Announcements:".getUnderLineAttributedText()
    announcementLabel.textAlignment = .justified
    announcementLabel.font = Font.large02
    eventname.textAlignment = .justified
    eventname.font = Font.large02
    eventDeatils.textAlignment = .justified
    eventDeatils.font = Font.small
    eventDeatils.numberOfLines = 10

    announcementLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    announcementLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    announcementLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true

    eventname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150).isActive = true
    eventname.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    eventname.widthAnchor.constraint(equalToConstant: frame.width).isActive = true

    eventDeatils.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    eventDeatils.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
    eventDeatils.widthAnchor.constraint(equalToConstant: frame.width - 20).isActive = true
  }
}

extension String {
  func getUnderLineAttributedText() -> NSAttributedString {
    return NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
  }
}
