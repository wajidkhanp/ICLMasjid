//
//  ChecklistTableViewCell.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/22/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {
  let checkListItem: UILabel = Components.cellLable()

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    contentView.addSubview(checkListItem)
    checkListItem.font = Font.standard02
    checkListItem.textColor = GlobalData.darkBlueColor
    let marginGuide = contentView.layoutMarginsGuide

    checkListItem.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    checkListItem.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    checkListItem.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
  }
}
