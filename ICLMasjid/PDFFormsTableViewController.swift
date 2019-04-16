//
//  PDFFormsTableViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/7/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class PDFFormsTableViewController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.white
    navigationItem.title = "Program Registartion Forms"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    tableView.tableFooterView = UIView()
    tableView.register(GenericTableViewCell.self, forCellReuseIdentifier: "aboutus001")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return GlobalData.pdfFormsList.count
  }

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 60.0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "aboutus001", for: indexPath) as! GenericTableViewCell
    cell.labelName.text = GlobalData.pdfFormsList[indexPath.row]
    cell.cellImage.image = UIImage(named: "pdf")
    cell.accessoryType = .disclosureIndicator
    return cell
  }

  override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
    let pdfName: String = GlobalData.pdfFormsNames[indexPath.row]
    print(pdfName)
    let viewCon = PDFViewController()
    viewCon.pdfName = pdfName
    navigationController?.pushViewController(viewCon, animated: true)
  }
}
