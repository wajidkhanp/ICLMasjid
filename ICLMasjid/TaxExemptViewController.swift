//
//  TaxExemptViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/2/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class TaxExemptViewController: UIViewController {
  let goalsText: String = GlobalData.taxExemptText
  var donationButton: UIButton = Components.butonElement(title: "Donate")
  lazy var scrollView: UIScrollView = {
    let view = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentSize.height = 800
    return view

  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.title = "501(c)(3) tax exempt"

    view.addSubview(scrollView)
    setupScrollView()
    donationButton.addTarget(self, action: #selector(donate), for: .touchUpInside)
  }

  func setupScrollView() {
    scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    let goalsDiscriptionLabel: UILabel = Components.descriptionLable(text: goalsText)
    goalsDiscriptionLabel.numberOfLines = 200
    goalsDiscriptionLabel.font = Font.standard02
    goalsDiscriptionLabel.textColor = GlobalData.darkBlueColor

    scrollView.addSubview(goalsDiscriptionLabel)

    goalsDiscriptionLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    goalsDiscriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5).isActive = true
    goalsDiscriptionLabel.widthAnchor.constraint(equalToConstant: 380).isActive = true
    goalsDiscriptionLabel.heightAnchor.constraint(equalToConstant: 660).isActive = true

    scrollView.addSubview(donationButton)

    donationButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    donationButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 680).isActive = true
    donationButton.widthAnchor.constraint(equalToConstant: 360).isActive = true
    donationButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    donationButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }

  @objc func donate() {
    navigationController?.pushViewController(DonationsTableViewController(), animated: true)
  }
}
