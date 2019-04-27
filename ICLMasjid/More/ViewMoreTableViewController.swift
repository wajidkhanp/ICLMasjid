//
//  ViewMoreTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/9/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class ViewMoreTableViewController: UITableViewController {
  
  let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
  let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "View More"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    tableView.tableFooterView = UIView()
    tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: "more001")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false
    
    let version = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
    version.font = Font.small
    version.text = "App Version: \(appVersion!)(\(buildNumber))"
    version.textColor = UIColor.darkGray
    version.textAlignment = .center
    tableView.tableFooterView  = version
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return GlobalData.viewMoreList.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = (tableView.dequeueReusableCell(withIdentifier: "more001", for: indexPath) as? GenericTableViewCell)!
    cell.labelName.text = GlobalData.viewMoreList[indexPath.row]
    cell.cellImage.image = UIImage(named: "\(GlobalData.viewMoreImages[indexPath.row])")
    cell.accessoryType = .disclosureIndicator
    return cell
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      navigationController?.pushViewController(EventsTableViewController(), animated: true)
    case 1:
      navigationController?.pushViewController(RegisterWithUSViewController(), animated: true)
    case 2:
      navigationController?.pushViewController(SendMessageViewController(), animated: true)
    case 3:
      let controller = WebviewViewController()
      controller.webViewURL = "https://www.facebook.com/Islamic-Center-of-Laveen-ICL-198563370199638/"
      navigationController?.pushViewController(controller, animated: true)
    default:
      print("not a valid selection")
    }
  }
}
