//
//  SendMessageViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/9/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

class SendMessageViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var masjidMember = MasjidMembers(fName: "", lName: "", email: "", phone: "")
  var textViewClearedOnInitialEdit: Bool = false

  let fnTextFiled: UITextField = Components.inputTestFiled(placeHolder: "First Name")
  let lnTextFiled: UITextField = Components.inputTestFiled(placeHolder: "Last Name")
  let emTextFiled: UITextField = Components.inputTestFiled(placeHolder: "Email Address to reach you")
  let messageTextFiled: UITextView = Components.inputTextView(placeHolder: "Please share your feedback or send a message to ICL masjid")

  let submitButton: UIButton = Components.butonElement(title: "Send")
  let disclosure: UILabel = Components.subHeadingLabel(text: "All of your personal information will remain confidential!!")

  let scrollView = UIScrollView()
  let contentView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Feedback or Comments"
    setUpScrollView()
    setupViews()
    keybordSetup()

    submitButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)

    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow),
                                           name: UIResponder.keyboardDidShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide),
                                           name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  func setUpScrollView() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.backgroundColor = UIColor.white
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)

    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }

  func setupViews() {
    let marginGuide = contentView.layoutMarginsGuide

    contentView.addSubview(fnTextFiled)
    contentView.addSubview(lnTextFiled)
    contentView.addSubview(emTextFiled)
    contentView.addSubview(messageTextFiled)
    contentView.addSubview(submitButton)
    contentView.addSubview(disclosure)

    disclosure.textColor = UIColor.red

    fnTextFiled.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    fnTextFiled.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 10).isActive = true
    fnTextFiled.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    fnTextFiled.heightAnchor.constraint(equalToConstant: 40).isActive = true

    lnTextFiled.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    lnTextFiled.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 70).isActive = true
    lnTextFiled.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    lnTextFiled.heightAnchor.constraint(equalToConstant: 40).isActive = true

    emTextFiled.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    emTextFiled.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 130).isActive = true
    emTextFiled.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    emTextFiled.heightAnchor.constraint(equalToConstant: 40).isActive = true

    messageTextFiled.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    messageTextFiled.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 190).isActive = true
    messageTextFiled.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    messageTextFiled.heightAnchor.constraint(equalToConstant: 120).isActive = true

    submitButton.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    submitButton.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 340).isActive = true
    submitButton.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    submitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

    disclosure.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    disclosure.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 400).isActive = true
    disclosure.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    disclosure.heightAnchor.constraint(equalToConstant: 40).isActive = true
    disclosure.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
  }

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case fnTextFiled:
      lnTextFiled.becomeFirstResponder()
    case lnTextFiled:
      emTextFiled.becomeFirstResponder()
    case emTextFiled:
      messageTextFiled.becomeFirstResponder()

    default:
      textField.resignFirstResponder()
    }
    return false
  }

  @objc func keyboardDidShow(notification: NSNotification) {
    var info = notification.userInfo
    let keyBoardSize = info![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
    scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyBoardSize.height, right: 0.0)
    scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyBoardSize.height, right: 0.0)
  }

  @objc func keyboardDidHide(notification _: NSNotification) {
    scrollView.contentInset = UIEdgeInsets.zero
    scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
  }

  @objc func registerUser() {
    // getting a reference to the node members
    ref = Database.database().reference().child("masjid-feedback")
    if (fnTextFiled.text?.isEmpty)! || (lnTextFiled.text?.isEmpty)! || (emTextFiled.text?.isEmpty)! || (messageTextFiled.text?.isEmpty)! {
      let alertCon = UIAlertController(title: "Input empty", message: "At least one or more inputs are empty. Please provide all required information", preferredStyle: .alert)
      alertCon.addAction(UIAlertAction(title: "OK", style: .default))
      present(alertCon, animated: true)
    } else {
      addMember()
    }
  }

  func addMember() {
    let key = ref.childByAutoId().key
    // creating member with the given values
    let member = ["firstname": fnTextFiled.text! as String,
                  "lastName": lnTextFiled.text! as String,
                  "emailAddress": emTextFiled.text! as String,
                  "message": messageTextFiled.text! as String]

    // adding the member inside the generated unique key
    ref.child(key!).setValue(member)

    let alertCon = UIAlertController(title: "Message sent", message: "Your message to ICL Masjid has been recieved Successful", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { _ in
      self.navigationController?.popViewController(animated: true)
    }
    alertCon.addAction(okAction)
    present(alertCon, animated: true, completion: nil)
  }

  func keybordSetup() {
    fnTextFiled.delegate = self
    fnTextFiled.keyboardType = UIKeyboardType.default
    fnTextFiled.returnKeyType = .done

    lnTextFiled.delegate = self
    lnTextFiled.keyboardType = UIKeyboardType.default
    lnTextFiled.returnKeyType = .done

    emTextFiled.delegate = self
    emTextFiled.keyboardType = UIKeyboardType.emailAddress
    emTextFiled.returnKeyType = .done

    messageTextFiled.delegate = self
    messageTextFiled.keyboardType = UIKeyboardType.decimalPad
    messageTextFiled.returnKeyType = .done
  }

  func textViewDidBeginEditing(_: UITextView) {
    if !textViewClearedOnInitialEdit {
      messageTextFiled.text = ""
      textViewClearedOnInitialEdit = true
    }
  }
}
