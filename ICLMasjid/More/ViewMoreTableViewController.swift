//
//  ViewMoreTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/9/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class ViewMoreTableViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "View More"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    tableView.tableFooterView = UIView()
    tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: "more001")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return GlobalData.viewMoreList.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = (tableView.dequeueReusableCell(withIdentifier: "more001", for: indexPath) as? GenericTableViewCell)!
    cell.labelName.text = GlobalData.viewMoreList[indexPath.row]
    cell.cellImage.image = UIImage(named: "\(GlobalData.viewMoreImages[indexPath.row])")
    cell.accessoryType = .disclosureIndicator
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      navigationController?.pushViewController(RegisterWithUSViewController(), animated: true)
    case 1:
      navigationController?.pushViewController(SendMessageViewController(), animated: true)
    case 2:
      navigationController?.pushViewController(DonationsTableViewController(), animated: true)
    case 4:
      navigationController?.pushViewController(DonationsTableViewController(), animated: true)
    default:
      print("not a valid selection")
    }
  }
}
