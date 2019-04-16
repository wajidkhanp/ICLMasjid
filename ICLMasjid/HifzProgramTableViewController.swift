//
//  HifzProgramTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/7/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class HifzProgramTableViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "NAQ Hifz Program"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    tableView.tableFooterView = UIView()
    tableView.register(NAQTableViewCell.self, forCellReuseIdentifier: "naq001")

    tableView.delegate = self
    tableView.dataSource = self

    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 200
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return HifzProgram.cellHeading.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "naq001", for: indexPath) as! NAQTableViewCell

    cell.cellImage.image = UIImage(named: "\(HifzProgram.cellImage[indexPath.row])")
    cell.cellTitle.text = HifzProgram.cellHeading[indexPath.row]
    cell.cellDesLabel.attributedText = Helper.app.stringToHtml(htmlTest: "\(HifzProgram.cellContent[indexPath.row])")
    cell.cellDesLabel.font = Font.standard02
    cell.cellDesLabel.textColor = GlobalData.darkBlueColor

    for _ in 0 ... 2 {
      cell.selectionStyle = .none
    }

    if indexPath.row == 3 {
      cell.accessoryType = .disclosureIndicator
    }
    return cell
  }

  func tableView(tableView _: UITableView, heightForRowAtIndexPath _: NSIndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 3 {
      navigationController?.pushViewController(PDFFormsTableViewController(), animated: true)
    }
  }
}
