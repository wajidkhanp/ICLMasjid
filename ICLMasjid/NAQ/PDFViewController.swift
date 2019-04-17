//
//  PDFViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 4/2/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import PDFKit
import UIKit

class PDFViewController: UIViewController, UIDocumentInteractionControllerDelegate {
  var pdfName: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "PDF File"

    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Print", style: .plain, target: self, action: #selector(printNow))

    let pdfView = PDFView()

    pdfView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pdfView)

    pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    pdfView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    guard let path = Bundle.main.url(forResource: pdfName, withExtension: "pdf") else { return }

    if let document = PDFDocument(url: path) {
      pdfView.document = document
    }

    /* //guard let path = Bundle.main.url(forResource: "NAQSundaySchool-RegistrationForm", withExtension: "pdf") else { return }
     guard let path =  Bundle.main.path(forResource: "NAQSundaySchool-RegistrationForm", ofType: ".pdf") else {return}
     let dc = UIDocumentInteractionController(url: URL(fileURLWithPath: "\(path)"))
     dc.delegate = self
     dc.presentPreview(animated: true)*/
  }

  func documentInteractionControllerViewControllerForPreview(_: UIDocumentInteractionController) -> UIViewController {
    return self // or use return self.navigationController for fetching app navigation bar colour
  }

  @objc func printNow() {
    if let guideUrl = Bundle.main.url(forResource: pdfName, withExtension: "pdf") {
      if UIPrintInteractionController.canPrint(guideUrl) {
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.jobName = guideUrl.lastPathComponent
        printInfo.outputType = .photo

        let printController = UIPrintInteractionController.shared
        printController.printInfo = printInfo
        printController.showsNumberOfCopies = false

        printController.printingItem = guideUrl
        printController.present(animated: true, completionHandler: nil)
      }
    }
  }
}
