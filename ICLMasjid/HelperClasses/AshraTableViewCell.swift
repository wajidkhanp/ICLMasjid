//
//  AshraTableViewCell.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class AshraTableViewCell: UITableViewCell {
  let day: UILabel = Components.ashraCellLable()
  let seher: UILabel = Components.ashraCellLable()
  let iftar: UILabel = Components.ashraCellLable()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    let marginGuide = contentView.layoutMarginsGuide
    contentView.addSubview(day)
    contentView.addSubview(seher)
    contentView.addSubview(iftar)

    day.font = Font.standard01
    day.textAlignment = .justified
    seher.font = Font.standard01
    iftar.font = Font.standard01

    day.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    day.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 20).isActive = true
    day.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3 + 10).isActive = true

    seher.centerXAnchor.constraint(equalTo: marginGuide.centerXAnchor).isActive = true
    seher.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 20).isActive = true
    seher.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true

    iftar.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    iftar.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 20).isActive = true
    iftar.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
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
