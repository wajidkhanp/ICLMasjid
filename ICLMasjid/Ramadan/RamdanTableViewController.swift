//
//  RamdanTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/7/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class RamdanTableViewController: UITableViewController {
  let tempView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
  let label = UILabel(frame: CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width - 30, height: 60))
  let ramadanText = Helper.app.daysLeftforRamadan(ramadanDate: "2019-05-06")

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "Ramadan"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationController?.navigationBar.removeShadow()

    tableView.tableFooterView = UIView()
    tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: "ramadan001")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false

    label.numberOfLines = 2
    label.font = Font.large02
    label.textColor = UIColor.white
    label.text = "\(ramadanText)"
    label.textAlignment = .center
    tempView.addSubview(label)
    tempView.backgroundColor = GlobalData.navigationMainColor
    tableView.tableHeaderView = tempView
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return GlobalData.ramadanView.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ramadan001", for: indexPath) as! GenericTableViewCell
    cell.labelName.text = GlobalData.ramadanView[indexPath.row]
    cell.cellImage.image = UIImage(named: "\(GlobalData.ramadanViewImages[indexPath.row])")
    cell.accessoryType = .disclosureIndicator
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      navigationController?.pushViewController(AshraScheduleTableViewController(), animated: true)
    case 1:
      navigationController?.pushViewController(ZakatViewController(), animated: true)
    case 2:
      navigationController?.pushViewController(RamadanChecklistTableViewController(), animated: true)
    default:
      print("not a valid selection")
    }
  }
}
