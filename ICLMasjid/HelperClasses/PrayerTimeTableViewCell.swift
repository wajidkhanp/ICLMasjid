//
//  PrayerTimeTableViewCell.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/28/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class PrayerTimeTableViewCell: UITableViewCell {
  let salathName: UILabel = Components.cellLable()
  let salathTime: UILabel = Components.cellLable()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(salathName)
    contentView.addSubview(salathTime)
    contentView.addSubview(cellImage)

    salathName.font = Font.small
    salathTime.font = Font.small

    salathName.backgroundColor = UIColor.clear
    salathTime.backgroundColor = UIColor.clear

    cellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
    cellImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
    cellImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true

    salathName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80).isActive = true
    salathName.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    salathName.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2).isActive = true

    salathTime.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
    salathTime.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    salathTime.widthAnchor.constraint(equalToConstant: contentView.frame.width / 2).isActive = true
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

  var cellImage: UIImageView = {
    var imageview = UIImageView()
    imageview.contentMode = UIView.ContentMode.scaleAspectFill
    // imageview.backgroundColor = UIColor.white
    imageview.translatesAutoresizingMaskIntoConstraints = false
    return imageview
  }()
}
