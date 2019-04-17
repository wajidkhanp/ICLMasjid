//
//  DonationsTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/1/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class DonationsTableViewController: UITableViewController {
  let tempView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
  let label = UILabel(frame: CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width - 30, height: 60))

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.title = "ICL Masjid Donation"
    navigationController?.navigationBar.removeShadow()

    tableView.tableFooterView = UIView()
    tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: "donate001")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false

    label.numberOfLines = 2
    label.font = Font.large02
    label.textColor = UIColor.white
    label.text = "Donations can be paid via "
    label.textAlignment = .center
    tempView.addSubview(label)
    tempView.backgroundColor = GlobalData.navigationMainColor
    tableView.tableHeaderView = tempView
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return GlobalData.donationFormsList.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "donate001", for: indexPath) as! GenericTableViewCell
    cell.labelName.text = GlobalData.donationFormsList[indexPath.row]
    cell.cellImage.image = UIImage(named: "\(GlobalData.donationFormsImages[indexPath.row])")
    if indexPath.row < 3 {
      cell.accessoryType = .disclosureIndicator
    } else {
      cell.selectionStyle = .none
    }
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      let controller = WebviewViewController()
      controller.webViewURL = "https://www.paypal.com/us/for-you/transfer-money/send-money"
      navigationController?.pushViewController(controller, animated: true)
    case 1:
      let controller = WebviewViewController()
      controller.webViewURL = "https://venmo.com/account/sign-in"
      navigationController?.pushViewController(controller, animated: true)
    case 2:
      let controller = WebviewViewController()
      controller.webViewURL = "https://www.gofundme.com/islamic-center-of-laveen-arizona"
      navigationController?.pushViewController(controller, animated: true)
    default:
      print("not a valid selection")
    }
  }
}
