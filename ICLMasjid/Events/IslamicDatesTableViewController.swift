//
//  IslamicDatesTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/6/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

class IslamicDatesTableViewController: UITableViewController {
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var islamicDateList = [IslamicDates]()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.white
    navigationItem.title = "Islamic Dates - 2019"

    tableView.tableFooterView = UIView()
    tableView.register(IslamicDatesTableViewCell.self, forCellReuseIdentifier: "postcell")

    tableView.delegate = self
    tableView.dataSource = self

    // Set the database referece
    ref = Database.database().reference().child("islamicDates")
    ref.observeSingleEvent(of: .value, with: { snapshot in

      if !snapshot.exists() { return }
      if snapshot.childrenCount > 0 {
        self.islamicDateList.removeAll()
        print(snapshot)
        for islamicEvents in snapshot.children.allObjects as! [DataSnapshot] {
          let islamicEventObject = islamicEvents.value as? [String: AnyObject]
          let date = islamicEventObject?["date"]
          let islamicdate = islamicEventObject?["islamicdate"]
          let name = islamicEventObject?["name"]

          let event = IslamicDates(date: date as! String, event: islamicdate as! String, islamicDay: name as! String)
          self.islamicDateList.append(event)
        }
        self.tableView.reloadData()
      }
    })
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return islamicDateList.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! IslamicDatesTableViewCell
    let islamicDate: IslamicDates = islamicDateList[indexPath.row]

    cell.dateLabel.text = islamicDate.date
    cell.evenLabel.text = islamicDate.islamicDay
    cell.islamicDateLabel.text = islamicDate.event
    cell.selectionStyle = .none
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 80.0
  }
}
