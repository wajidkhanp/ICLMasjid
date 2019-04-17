//
//  WebviewViewController.swift
//  ICLMasjid
//
//  Created by Wajid K Patan on 4/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController, WKNavigationDelegate {
  
  var webView: WKWebView!
  var navigationTitle: String = "Test Account Portal"
  var webViewURL = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "Masjid Donations"
    
    let myView = UIView(frame: CGRect(x: 0, y: 72, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width-72))
    self.view.addSubview(myView)
    
    webView = WKWebView()
    webView.navigationDelegate = self
    let url = URL(string: webViewURL)!
    webView.load(URLRequest(url: url))
    webView.allowsBackForwardNavigationGestures = true
    view = webView
  }

  
}
