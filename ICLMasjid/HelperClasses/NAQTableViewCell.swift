//
//  NAQTableViewCell.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/7/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class NAQTableViewCell: UITableViewCell {
  let cellTitle: UILabel = Components.descriptionLable(text: "")
  let cellDesLabel: UILabel = Components.descriptionLable(text: "")

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    let marginGuide = contentView.layoutMarginsGuide
    contentView.addSubview(cellTitle)
    contentView.addSubview(cellDesLabel)
    contentView.addSubview(cellImage)

    cellTitle.font = Font.xlarge02
    cellTitle.textColor = GlobalData.darkBlueColor
    cellTitle.numberOfLines = 0
    cellDesLabel.font = Font.small
    cellDesLabel.textColor = GlobalData.darkBlueColor
    cellDesLabel.numberOfLines = 0

    cellImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    cellImage.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
    cellImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true

    cellTitle.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 50).isActive = true
    cellTitle.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
    cellTitle.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true

    cellDesLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 50).isActive = true
    cellDesLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 40).isActive = true
    cellDesLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    cellDesLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
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
    imageview.backgroundColor = UIColor.white
    imageview.translatesAutoresizingMaskIntoConstraints = false
    return imageview
  }()
}
