//
//  GoalsViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/1/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController {
  let goalsText: String = GlobalData.goalsDescriptionText
  var donationButton: UIButton = Components.butonElement(title: "Donate")

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.title = "ICL Goals & Mission"

    setUp()
    donationButton.addTarget(self, action: #selector(donate), for: .touchUpInside)
  }

  func setUp() {
    let goalsDiscriptionLabel: UILabel = Components.descriptionLable(text: goalsText)
    view.addSubview(goalsDiscriptionLabel)
    view.addSubview(donationButton)
    goalsDiscriptionLabel.numberOfLines = 20
    goalsDiscriptionLabel.font = Font.standard02
    goalsDiscriptionLabel.textColor = GlobalData.darkBlueColor
    donationButton.titleLabel?.font = Font.large02

    goalsDiscriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    goalsDiscriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
    goalsDiscriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
    goalsDiscriptionLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true

    donationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    donationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 360).isActive = true
    donationButton.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
    donationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }

  @objc func donate() {
    navigationController?.pushViewController(DonationsTableViewController(), animated: true)
  }
}
