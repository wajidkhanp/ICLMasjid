//
//  OrganizationTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/2/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

class OrganizationTableViewController: UITableViewController {
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var memberList = [MemberModle]()
  var eduMemberList = [MemberModle]()
  let sections = ["Board of Directors", "Board of Education"]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "ICL Organization"

    tableView.tableFooterView = UIView()
    tableView.register(OrganizationTableViewCell.self, forCellReuseIdentifier: "organization001")

    tableView.delegate = self
    tableView.dataSource = self

    // Set the database referece
    ref = Database.database().reference().child("organization/board-of-director")

    ref.observeSingleEvent(of: .value, with: { snapshot in

      if !snapshot.exists() { return }
      if snapshot.childrenCount > 0 {
        self.memberList.removeAll()
        for members in snapshot.children.allObjects as! [DataSnapshot] {
          let memberObj = members.value as? [String: AnyObject]
          let memberName = memberObj?["name"]
          let memberPosition = memberObj?["position"]
          let memberContact = memberObj?["contact"]

          let member = MemberModle(name: memberName as! String, position: memberPosition as! String, contact: memberContact as! String)

          self.memberList.append(member)
        }
        self.tableView.reloadData()
      }
    })

    ref = Database.database().reference().child("organization/board-of-education")

    ref.observeSingleEvent(of: .value, with: { snapshot in

      if !snapshot.exists() { return }
      if snapshot.childrenCount > 0 {
        self.eduMemberList.removeAll()
        for members in snapshot.children.allObjects as! [DataSnapshot] {
          let memberObj = members.value as? [String: AnyObject]
          let memberName = memberObj?["name"]
          let memberPosition = memberObj?["position"]
          let memberContact = memberObj?["contact"]

          let member = MemberModle(name: memberName as! String, position: memberPosition as! String, contact: memberContact as! String)

          self.eduMemberList.append(member)
        }
        self.tableView.reloadData()
      }
    })
  }

  override func numberOfSections(in _: UITableView) -> Int {
    return sections.count
  }

  override func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section]
  }

  override func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return memberList.count
    } else {
      return eduMemberList.count
    }
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "organization001", for: indexPath) as! OrganizationTableViewCell
    if indexPath.section == 0 {
      let member: MemberModle = memberList[indexPath.row]
      cell.cellImage.image = UIImage(named: "organization")
      cell.memberName.text = member.name
      cell.memberPoition.text = member.position
      cell.memberContact.text = member.contact
    } else {
      let member: MemberModle = eduMemberList[indexPath.row]
      cell.cellImage.image = UIImage(named: "organization")
      cell.memberName.text = member.name
      cell.memberPoition.text = member.position
      cell.memberContact.text = member.contact
    }

    cell.selectionStyle = .none
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 80.0
  }
}
