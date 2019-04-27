//
//  DashboardCollectionViewController.swift
//  ICLMasjid
//
//  Created by Wajid K Patan on 4/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Adhan
import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

private let reuseIdentifier = "Cell"

class DashboardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  let backgroundImage: UIImageView = UIImageView(image: UIImage(named: "icl-masjid"))
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var dailyIqamaTimes = SalatTimings(fazar: "", sunrise: "", zohar: "", asar: "", magrib: "", isha: "")

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.tintColor = .white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    collectionView.backgroundView = backgroundImage
    collectionView.register(MasjidDetailsCollectionViewCell.self, forCellWithReuseIdentifier: GlobalData.collectionViewCellID)
    collectionView.register(DashboardHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GlobalData.collectionViewHeaderID)
  }

  override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
    return GlobalData.masjidDetailsCellContents.count
  }

  func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
    return CGSize(width: collectionView.frame.size.width, height: 510.0)
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalData.collectionViewCellID,
                                                  for: indexPath) as! MasjidDetailsCollectionViewCell
    cell.cellContent = GlobalData.masjidDetailsCellContents[indexPath.item]
    cell.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    cell.layer.borderColor = UIColor.clear.cgColor
    cell.layer.borderWidth = 2
    cell.layer.cornerRadius = 8
    return cell
  }

  func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
    return CGSize(width: (view.frame.width / 3) - 16, height: (view.frame.width / 3) - 40)
  }

  func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
  }

  override func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let index = indexPath.row
    switch index {
    case 0:
      navigationController?.pushViewController(MasjidLocationViewController(), animated: true)
    case 1:
      navigationController?.pushViewController(AboutUsTableViewController(), animated: true)
    case 2:
      navigationController?.pushViewController(DonationsTableViewController(), animated: true)
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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // Hide the navigation bar on the this view controller
    navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    // Show the navigation bar on other view controllers
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GlobalData.collectionViewHeaderID, for: indexPath) as! DashboardHeader
    let currentDate: String = Helper.app.dateFormatter(date: Date())
    headerView.mainHeadingLabel.text = "Islamic Center of Laveen"
    headerView.dateLabel.text = "Today: \(currentDate) (\(Helper.app.getIslamicDate()))"
    let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    
    headerView.announcementView.addGestureRecognizer(gesture)
    return headerView
  }
  @objc func viewTapped() {
    navigationController?.pushViewController(MasjidEventsTableViewController(), animated: true)
  }
}
