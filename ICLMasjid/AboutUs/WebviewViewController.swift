//
//  WebviewViewController.swift
//  ICLMasjid
//
//  Created by Wajid K Patan on 4/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import WebKit

class WebviewViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
  var webView: WKWebView!
  var loadIndicator: UIActivityIndicatorView!
  var webViewURL: String = ""

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "Islamic Center of Laveen (ICL)"

    webView = WKWebView(frame: self.view.frame)
    webView.translatesAutoresizingMaskIntoConstraints = false
    webView.isUserInteractionEnabled = true
    webView.navigationDelegate = self
    webView.uiDelegate = self
    
    view.addSubview(webView)
    
    loadIndicator = UIActivityIndicatorView()
    loadIndicator.center = self.view.center
    loadIndicator.hidesWhenStopped = true
    loadIndicator.color = UIColor.purple
    loadIndicator.layer.borderWidth = 4
    
    view.addSubview(loadIndicator)
    
    let url = URL(string: webViewURL)!
    webView.load(URLRequest(url: url))
    webView.allowsBackForwardNavigationGestures = true
  }
  func showActivityIndicator(show: Bool) {
    if show {
      loadIndicator.startAnimating()
    } else {
      loadIndicator.stopAnimating()
    }
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    showActivityIndicator(show: false)
  }
  
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    showActivityIndicator(show: true)
  }
  
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    showActivityIndicator(show: false)
  }
}
