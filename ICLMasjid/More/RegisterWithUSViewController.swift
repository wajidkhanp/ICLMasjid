//
//  RegisterWithUSViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/7/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import FirebaseDatabase
import FirebaseUI
import UIKit

class RegisterWithUSViewController: UIViewController, UITextFieldDelegate {
  var ref: DatabaseReference!
  var databaseHandle: DatabaseHandle!
  var masjidMember = MasjidMembers(fName: "", lName: "", email: "", phone: "")

  let fnTextFiled: UITextField = Components.inputTestFiledWithSuperscript(placeHolder: "First Name*", location: 10)
  let lnTextFiled: UITextField = Components.inputTestFiledWithSuperscript(placeHolder: "Last Name*", location: 9)
  let emTextFiled: UITextField = Components.inputTestFiledWithSuperscript(placeHolder: "Email Address*", location: 13)
  let cnTextFiled: UITextField = Components.inputTestFiledWithSuperscript(placeHolder: "Contact Number*", location: 14)

  let submitButton: UIButton = Components.butonElement(title: "Register")
  let disclosure: UILabel = Components.subHeadingLabel(text: "All of your personal information will remain confidential!!")

  let scrollView = UIScrollView()
  let contentView = UIView()

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Register with ICL"
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
    contentView.addSubview(cnTextFiled)
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

    cnTextFiled.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    cnTextFiled.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 190).isActive = true
    cnTextFiled.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    cnTextFiled.heightAnchor.constraint(equalToConstant: 40).isActive = true

    submitButton.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    submitButton.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 260).isActive = true
    submitButton.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
    submitButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

    disclosure.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
    disclosure.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 320).isActive = true
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
      cnTextFiled.becomeFirstResponder()

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
    ref = Database.database().reference().child("masjid-members")
    if (fnTextFiled.text?.isEmpty)! || (lnTextFiled.text?.isEmpty)! || (emTextFiled.text?.isEmpty)! || (cnTextFiled.text?.isEmpty)! {
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
                  "contactNumber": cnTextFiled.text! as String]

    // adding the member inside the generated unique key
    ref.child(key!).setValue(member)

    let alertCon = UIAlertController(title: "Registration is Successful", message: "Your details are saved !!!", preferredStyle: .alert)
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

    cnTextFiled.delegate = self
    cnTextFiled.keyboardType = UIKeyboardType.decimalPad
    cnTextFiled.returnKeyType = .done
  }
}

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tapGesture = UITapGestureRecognizer(target: self,
                                            action: #selector(hideKeyboard))
    view.addGestureRecognizer(tapGesture)
  }

  @objc func hideKeyboard() {
    view.endEditing(true)
  }
}
