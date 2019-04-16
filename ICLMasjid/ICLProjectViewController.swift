//
//  ICLProjectViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/12/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class ICLProjectViewController: UIViewController {
  let underConstLabel: UILabel = Components.descriptionLable(text: "Under Construction")

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = GlobalData.lightBlue
    navigationItem.title = "ICL Project Updates"

    view.addSubview(underConstLabel)

    underConstLabel.font = Font.displayLarge
    underConstLabel.textColor = UIColor.red
    underConstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    underConstLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    underConstLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

    // Do any additional setup after loading the view.
  }

  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
}
