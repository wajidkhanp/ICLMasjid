//
//  DashboardHeader.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseUI
import UIKit

class DashboardHeader: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
  let mainHeadingLabel: UILabel = Components.mainHeadingLable(text: "")
  let dateLabel: UILabel = Components.subHeadingLabel(text: "")

  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var dailyIqamaTimes = SalatTimings(fazar: "", sunrise: "", zohar: "", asar: "", magrib: "", isha: "")
  var tableView = UITableView()
  let topView: UIView = UIView(frame: CGRect(x: 8, y: 50, width: UIScreen.main.bounds.size.width - 16, height: 310))
  var salathview = UIView(frame: CGRect(x: 16, y: 50, width: UIScreen.main.bounds.size.width - 48, height: 260))
  var announcementView: UIView = AnnouncementView(frame: CGRect(x: 8, y: 370, width: UIScreen.main.bounds.size.width - 16, height: 140))

  let segment: UISegmentedControl = Components.getSegmentedControll(items: GlobalData.segmentData)
  let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

  lazy var salatTimes: [String] = Helper.app.prayerTimes()
  let todaysDate = Helper.app.dateFormatter(date: Date())
  var salathNames: [String] = GlobalData.prayerTimeNames
  var salathImage: [String] = GlobalData.salatImages

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupHeaderViews()
  }

  func setupHeaderViews() {
    addSubview(mainHeadingLabel)
    addSubview(dateLabel)
    addSubview(topView)
    tableView.tableFooterView = UIView()
    topView.addSubview(segment)
    topView.addSubview(salathview)

    announcementView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    announcementView.layer.cornerRadius = 8

    addSubview(announcementView)

    dateLabel.font = Font.small
    setup()

    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(PrayerTimeTableViewCell.self, forCellReuseIdentifier: "cell")
    tableView.separatorStyle = .none

    segment.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
    UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
    UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)

    // Set the database referece
    ref = Database.database().reference().child("daily-iqma-times")
    ref.observeSingleEvent(of: .value, with: { snapshot in

      if !snapshot.exists() { return }
      if snapshot.childrenCount > 0 {
        print(snapshot)
        print("snapshot childrens")
        print(snapshot.children.allObjects)

        let value = snapshot.value as? NSDictionary
        self.dailyIqamaTimes.fazar = value?["fazar"] as? String ?? ""
        self.dailyIqamaTimes.zohar = value?["duhar"] as? String ?? ""
        self.dailyIqamaTimes.asar = value?["asar"] as? String ?? ""
        self.dailyIqamaTimes.magrib = value?["magrib"] as? String ?? ""
        self.dailyIqamaTimes.isha = value?["isha"] as? String ?? ""
      }
    })
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setup() {
    mainHeadingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    mainHeadingLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    mainHeadingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true

    dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
    dateLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
    dateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

    segment.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
    segment.widthAnchor.constraint(equalToConstant: topView.frame.width - 35).isActive = true
    segment.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true

    tableView = UITableView(frame: CGRect(x: 0, y: 0, width: salathview.frame.width, height: salathview.frame.height))
    salathview.addSubview(tableView)
    salathview.backgroundColor = UIColor.purple.withAlphaComponent(0.2)
    salathview.layer.cornerRadius = 8
    tableView.backgroundColor = UIColor.clear
  }

  func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return salatTimes.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PrayerTimeTableViewCell
    cell.salathName.text = salathNames[indexPath.row]
    cell.salathTime.text = salatTimes[indexPath.row]
    cell.salathTime.textAlignment = .right
    cell.cellImage.image = UIImage(named: salathImage[indexPath.row])!.maskWithColor(color: UIColor.white)
    cell.selectionStyle = .none
    cell.backgroundColor = UIColor.clear
    return cell
  }

  @objc func handleSegmentChange() {
    switch segment.selectedSegmentIndex {
    case 0:
      salathNames = GlobalData.prayerTimeNames
      salatTimes = Helper.app.prayerTimes()
      salathImage = GlobalData.salatImages
    case 1:
      salathNames = GlobalData.iqamaTimeNames
      salatTimes = [dailyIqamaTimes.fazar, dailyIqamaTimes.zohar, dailyIqamaTimes.asar, dailyIqamaTimes.magrib, dailyIqamaTimes.isha] as! [String]
      salathImage = GlobalData.IqamaImages
    case 2:
      salathNames = GlobalData.JumaTimeNames
      salatTimes = GlobalData.JuneTime
      salathImage = GlobalData.jumaImages
    default:
      print("Selected index does not exist")
    }

    tableView.reloadData()
  }
}
