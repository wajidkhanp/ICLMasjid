//
//  RamadanChecklistTableViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/22/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class RamadanChecklistTableViewController: UITableViewController {
  let segment: UISegmentedControl = Components.getSegmentedControll(items: ["Daily", "Weekly", "Monthly"])
  let tempView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))

  lazy var rowsToDisplay = GlobalData.daily

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.white
    navigationItem.title = "Ramadan Checklist"

    tableView.tableFooterView = UIView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(ChecklistTableViewCell.self, forCellReuseIdentifier: "checklist007")

    tempView.addSubview(segment)
    tempView.backgroundColor = UIColor.white
    tableView.tableHeaderView = tempView

    let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    segment.setTitleTextAttributes(titleTextAttributes, for: .normal)
    segment.setTitleTextAttributes(titleTextAttributes, for: .selected)

    let marginGuide = view.layoutMarginsGuide
    segment.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    segment.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
    segment.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true

    segment.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
  }

  @objc func handleSegmentChange() {
    switch segment.selectedSegmentIndex {
    case 0:
      rowsToDisplay = GlobalData.daily
    case 1:
      rowsToDisplay = GlobalData.weekly
    case 2:
      rowsToDisplay = GlobalData.monthly
    default:
      print("Selected index does not exist")
    }

    tableView.reloadData()
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return rowsToDisplay.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "checklist007", for: indexPath) as! ChecklistTableViewCell
    cell.checkListItem.text = rowsToDisplay[indexPath.row]
    cell.selectionStyle = .none
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }
}
