//
//  MasjidEventsTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/6/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

class MasjidEventsTableViewController: UITableViewController {
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var eventList = [MasjidEvents]()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.white
    navigationItem.title = "Upcoming Events"

    tableView.tableFooterView = UIView()
    tableView.register(MasjidEventsTableViewCell.self, forCellReuseIdentifier: "postcell")

    tableView.delegate = self
    tableView.dataSource = self

    // Set the database referece
    ref = Database.database().reference().child("upcomming-events")
    ref.observeSingleEvent(of: .value, with: { snapshot in

      if !snapshot.exists() { return }
      if snapshot.childrenCount > 0 {
        self.eventList.removeAll()
        print(snapshot)
        for masjidEvents in (snapshot.children.allObjects as? [DataSnapshot])! {
          let masjidEventObject = masjidEvents.value as? [String: AnyObject]
          let date = masjidEventObject?["date"]
          let eventDescription = masjidEventObject?["event-description"]
          let eventName = masjidEventObject?["event-name"]

          let event = MasjidEvents(date: (date as? String)!, eventName: (eventName as? String)!, eventDes: (eventDescription as? String)!)
          self.eventList.append(event)
        }
        self.tableView.reloadData()
      }
    })

    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 200
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return eventList.count
  }

  func tableView(tableView _: UITableView, heightForRowAtIndexPath _: NSIndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = (tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as? MasjidEventsTableViewCell)!
    let eventName: MasjidEvents = eventList[indexPath.row]

    cell.dateLabel.text = eventName.date
    cell.evenLabel.text = eventName.eventName
    cell.eventDescLabel.text = eventName.eventDes
    cell.selectionStyle = .none
    return cell
  }
}
