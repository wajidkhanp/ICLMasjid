//
//  MasjidDetailsCollectionViewCell.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/31/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class MasjidDetailsCollectionViewCell: UICollectionViewCell {
  var cellContent: MasjidDetailsCellContent? {
    didSet {
      guard let tempname = cellContent?.masjidDetailsCellLable else { return }
      guard let tempImage = cellContent?.masjidDetailsCellImage else { return }

      cellLableText.text = tempname
      cellImage.image = UIImage(named: tempImage)!.maskWithColor(color: GlobalData.greenColor)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup() {
    addSubview(cellLableText)
    addSubview(cellImage)
    cellLableText.translatesAutoresizingMaskIntoConstraints = false
    cellImage.translatesAutoresizingMaskIntoConstraints = false
    cellLableText.widthAnchor.constraint(equalToConstant: 80).isActive = true
    cellLableText.heightAnchor.constraint(equalToConstant: 40).isActive = true
    cellLableText.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 2).isActive = true
    cellLableText.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
    cellImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
    cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    cellImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    cellImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
  }

  var cellLableText: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.white
    label.font = Font.small
    label.numberOfLines = 2
    label.textAlignment = .center
    return label
  }()

  var cellImage: UIImageView = {
    var imageview = UIImageView()
    imageview.contentMode = UIView.ContentMode.scaleAspectFill
    return imageview
  }()
}
