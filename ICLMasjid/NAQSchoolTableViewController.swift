//
//  NAQSchoolTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/2/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class NAQSchoolTableViewController: UITableViewController {
  let tempView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 280))
  let label = UILabel(frame: CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width - 30, height: 280))
  let NAQprogramlist = ["Noor Al-Quran (NAQ) Hifz Program", "Noor Al-Quran (NAQ) Sunday School"]
  let NAQprogramlistImages = ["quran", "school"]
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.white
    navigationItem.title = "ICL Noor Al-Quran"
    navigationController?.navigationBar.removeShadow()
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    tableView.tableFooterView = UIView()
    tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: "naq009")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false

    let htmlString = GlobalData.NAQschoolHeaderText
    let data = htmlString.data(using: String.Encoding.unicode)!
    let attrStr = try? NSAttributedString(
      data: data,
      options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
      documentAttributes: nil
    )
    label.attributedText = attrStr
    label.numberOfLines = 20
    label.font = Font.standard02
    label.textColor = GlobalData.darkBlueColor
    label.textAlignment = .natural
    tempView.addSubview(label)
    // v.backgroundColor = UIColor.purple.withAlphaComponent(0.2)
    tableView.tableHeaderView = tempView
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return 2
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "naq009", for: indexPath) as! GenericTableViewCell
    cell.labelName.text = NAQprogramlist[indexPath.row]
    cell.cellImage.image = UIImage(named: "\(NAQprogramlistImages[indexPath.row])")
    cell.accessoryType = .disclosureIndicator
    return cell
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      navigationController?.pushViewController(HifzProgramTableViewController(), animated: true)
    case 1:
      navigationController?.pushViewController(SundaySchoolTableViewController(), animated: true)
    default:
      print("incorrectSelection")
    }
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }
}
