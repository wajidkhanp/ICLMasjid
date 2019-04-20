//
//  MasjidEventsTableViewCell.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/6/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class MasjidEventsTableViewCell: UITableViewCell {
  let dateLabel: UILabel = Components.cellLable()
  let evenLabel: UILabel = Components.cellLable()
  let eventDescLabel: UILabel = Components.cellLable()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    let marginGuide = contentView.layoutMarginsGuide
    contentView.addSubview(dateLabel)
    contentView.addSubview(evenLabel)
    contentView.addSubview(eventDescLabel)

    dateLabel.font = Font.large02
    dateLabel.backgroundColor = GlobalData.greenColor
    dateLabel.textColor = UIColor.white
    dateLabel.textAlignment = .center
    dateLabel.numberOfLines = 0
    evenLabel.font = Font.xlarge02
    eventDescLabel.font = Font.small
    evenLabel.textColor = GlobalData.darkBlueColor
    evenLabel.numberOfLines = 0
    eventDescLabel.textColor = GlobalData.darkBlueColor
    eventDescLabel.numberOfLines = 0

    dateLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    dateLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
    dateLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    dateLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true

    evenLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 70).isActive = true
    evenLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
    evenLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true

    eventDescLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 70).isActive = true
    eventDescLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 40).isActive = true
    eventDescLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width - 40).isActive = true
    eventDescLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
