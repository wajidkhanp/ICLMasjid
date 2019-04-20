//
//  GenericTableViewCell.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/2/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class GenericTableViewCell: UITableViewCell {
  let labelName: UILabel = Components.cellLable()
  let additionalText: UILabel = Components.cellLable()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(labelName)
    contentView.addSubview(additionalText)
    contentView.addSubview(cellImage)

    labelName.font = Font.large02
    labelName.textColor = GlobalData.darkOrange
    additionalText.font = Font.small

    cellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    cellImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    cellImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true

    labelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
    labelName.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    labelName.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true

    additionalText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70).isActive = true
    additionalText.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
    additionalText.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
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

extension UINavigationBar {
  /// The shadow this removes is a dark line that is visible
  /// when using the HeroView with a blue background.
  @objc public func removeShadow() {
    shadowImage = UIImage()
  }
}
