//
//  ViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/28/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

class LandingPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
  let backgroundImage: UIImageView = UIImageView(image: UIImage(named: "icl-masjid"))
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var dailyIqamaTimes = SalatTimings(fazar: "", sunrise: "", zohar: "", asar: "", magrib: "", isha: "")
  var tableView = UITableView()
  var salathview = UIView(frame: CGRect(x: 30, y: 160, width: UIScreen.main.bounds.size.width - 60, height: UIScreen.main.bounds.size.height / 3 - 15))
  var announcementView: UIView = AnnouncementView(frame: CGRect(x: 5, y: 450, width: UIScreen.main.bounds.size.width - 10, height: 130))
  var masjidDeatilsview = UIView(frame: CGRect(x: 0, y: 500, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height / 2))

  let segment: UISegmentedControl = Components.getSegmentedControll(items: GlobalData.segmentData)
  let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

  lazy var salatTimes: [String] = Helper.app.prayerTimes()
  let todaysDate = Helper.app.dateFormatter(date: Date())
  var salathNames: [String] = GlobalData.prayerTimeNames
  var salathImage: [String] = GlobalData.salatImages

  let masjidHeading: UILabel = Components.mainHeadingLable(text: "Islamic Center of Laveen")
  let currentDate: String = Helper.app.dateFormatter(date: Date())
  let todaysdate: UILabel = Components.subHeadingLabel(text: "")

  override func viewDidLoad() {
    super.viewDidLoad()
    backgroundImage.contentMode = .scaleAspectFill

    navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.tintColor = .white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    view.addSubview(backgroundImage)
    view.sendSubviewToBack(backgroundImage)
    todaysdate.text = "Today: \(currentDate)"

    tableView.tableFooterView = UIView()
    view.addSubview(segment)
    view.addSubview(salathview)
    view.addSubview(masjidDeatilsview)
    view.addSubview(masjidHeading)
    view.addSubview(todaysdate)
    view.addSubview(announcementView)

    announcementView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    announcementView.layer.cornerRadius = 8

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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)

    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    layout.itemSize = CGSize(width: (masjidDeatilsview.frame.width / 3) - 16, height: (masjidDeatilsview.frame.height / 3) - 60)

    let myCollectionView: UICollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    myCollectionView.dataSource = self
    myCollectionView.delegate = self
    myCollectionView.register(MasjidDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "masjid001")
    myCollectionView.backgroundColor = UIColor.clear
    masjidDeatilsview.addSubview(myCollectionView)
  }

  func setup() {
    masjidHeading.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    masjidHeading.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
    masjidHeading.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true

    todaysdate.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    todaysdate.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
    todaysdate.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true

    segment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    segment.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
    segment.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true

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

  func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
    return GlobalData.masjidDetailsCellContents.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "masjid001", for: indexPath) as! MasjidDetailsCollectionViewCell
    cell.cellContent = GlobalData.masjidDetailsCellContents[indexPath.item]
    cell.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    cell.layer.borderColor = UIColor.clear.cgColor
    cell.layer.borderWidth = 2
    cell.layer.cornerRadius = 8
    return cell
  }

  func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let index = indexPath.row
    switch index {
    case 0:
      navigationController?.pushViewController(MasjidLocationViewController(), animated: true)
    case 1:
      navigationController?.pushViewController(AboutUsTableViewController(), animated: true)
    case 2:
      navigationController?.pushViewController(EventsTableViewController(), animated: true)
    case 3:
      navigationController?.pushViewController(NAQSchoolTableViewController(), animated: true)
    case 4:
      navigationController?.pushViewController(RamdanTableViewController(), animated: true)
    case 5:
      navigationController?.pushViewController(ViewMoreTableViewController(), animated: true)
    default:
      NSLog("Passed indexpath row does not exist")
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    // Show the navigation bar on other view controllers
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
}

extension UIImage {
  func maskWithColor(color: UIColor) -> UIImage? {
    let maskImage = cgImage!

    let width = size.width
    let height = size.height
    let bounds = CGRect(x: 0, y: 0, width: width, height: height)

    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
    let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8,
                            bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

    context.clip(to: bounds, mask: maskImage)
    context.setFillColor(color.cgColor)
    context.fill(bounds)

    if let cgImage = context.makeImage() {
      let coloredImage = UIImage(cgImage: cgImage)
      return coloredImage
    } else {
      return nil
    }
  }
}
