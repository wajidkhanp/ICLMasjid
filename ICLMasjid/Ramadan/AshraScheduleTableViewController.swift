//
//  MainScheduleTableViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

class AshraScheduleTableViewController: UITableViewController {
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var temporaryArry = [RamadanSalatTimings]()
  var ashraDetails = [RamadanSalatTimings]()
  let start: Int = 0
  let end: Int = 29
  lazy var ashraNumber: String = ""
  var ramadanStatDate: String = ""

  let tempView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
  let label = UILabel(frame: CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width - 30, height: 60))
  let todaysDate = Helper.app.dateFormatter(date: Date())

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = GlobalData.lightGray
    navigationItem.title = "Ramadan Schedule"
    navigationController?.navigationBar.removeShadow()

    tableView.tableFooterView = UIView()
    tableView.register(AshraTableViewCell.self, forCellReuseIdentifier: "postcell")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false

    label.numberOfLines = 2
    label.font = Font.large02
    label.textColor = UIColor.white
    label.text = "Today is: \(todaysDate)"
    label.textAlignment = .center
    tempView.addSubview(label)
    tempView.backgroundColor = GlobalData.navigationMainColor
    tableView.tableHeaderView = tempView

    // Set the database referece
    ref = Database.database().reference().child("ramadan")
    ref.observeSingleEvent(of: .value, with: { snapshot in

      if !snapshot.exists() { return }
      if snapshot.childrenCount > 0 {
        for days in snapshot.children.allObjects as! [DataSnapshot] {
          let startDate = days.value as! String
          self.ramadanStatDate = startDate
          self.temporaryArry = Helper.app.calculateRamadaMonthPrayerTimes(ramadanStartDate: self.ramadanStatDate)
          self.ashraDetails = Array(self.temporaryArry[self.start ... self.end])
        }
        self.tableView.reloadData()
      }
    })
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return ashraDetails.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! AshraTableViewCell
    let ashraDetailslist: RamadanSalatTimings = ashraDetails[indexPath.row]
    cell.selectionStyle = .none
    if indexPath.row == 0 {
      cell.backgroundColor = GlobalData.greenColor
      cell.textLabel?.font = Font.xlarge02
      cell.day.text = "Day"
      cell.day.textAlignment = .center
      cell.seher.text = "Sehar"
      cell.iftar.text = "Iftar"
    } else {
      cell.backgroundColor = UIColor.white

      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM d, EEEE"
      let myDate = dateFormatter.string(from: Date())
      if ashraDetailslist.day == myDate {
        cell.backgroundColor = GlobalData.creamRedColor
      }
      cell.day.text = ashraDetailslist.day
      cell.seher.text = ashraDetailslist.fazar
      cell.iftar.text = ashraDetailslist.magrib
    }
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 50.0
  }
}
