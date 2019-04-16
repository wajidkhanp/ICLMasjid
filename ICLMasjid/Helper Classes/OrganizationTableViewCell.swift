//
//  OrganizationTableViewCell.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/2/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class OrganizationTableViewCell: UITableViewCell {
  let memberName: UILabel = Components.cellLable()
  let memberPoition: UILabel = Components.cellLable()
  let memberContact: UILabel = Components.cellLable()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(memberName)
    contentView.addSubview(memberPoition)
    contentView.addSubview(memberContact)
    contentView.addSubview(cellImage)

    memberName.font = Font.large02
    memberName.textColor = GlobalData.darkBlueColor
    memberPoition.font = Font.small
    memberPoition.textColor = GlobalData.darkBlueColor
    memberContact.font = Font.small
    memberContact.textColor = GlobalData.darkBlueColor

    cellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    cellImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    cellImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true

    memberName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80).isActive = true
    memberName.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    memberName.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true

    memberPoition.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80).isActive = true
    memberPoition.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
    memberPoition.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true

    memberContact.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80).isActive = true
    memberContact.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
    memberContact.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
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
