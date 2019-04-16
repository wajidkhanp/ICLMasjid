//
//  AboutUsTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/1/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class AboutUsTableViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "About ICL Masjid"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    tableView.tableFooterView = UIView()
    tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: "aboutus001")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return GlobalData.aboutUSiamge.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = (tableView.dequeueReusableCell(withIdentifier: "aboutus001", for: indexPath) as? GenericTableViewCell)!
    cell.labelName.text = GlobalData.aboutUSlist[indexPath.row]
    cell.cellImage.image = UIImage(named: "\(GlobalData.aboutUSiamge[indexPath.row])")
    cell.accessoryType = .disclosureIndicator
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      navigationController?.pushViewController(GoalsViewController(), animated: true)
    case 1:
      navigationController?.pushViewController(OrganizationTableViewController(), animated: true)
    case 2:
      navigationController?.pushViewController(TaxExemptViewController(), animated: true)
    case 3:
      navigationController?.pushViewController(ICLProjectViewController(), animated: true)
    case 4:
      navigationController?.pushViewController(DonationsTableViewController(), animated: true)
    default:
      print("not a valid selection")
    }
  }
}
