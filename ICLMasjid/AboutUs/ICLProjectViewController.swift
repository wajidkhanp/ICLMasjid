//
//  ICLProjectViewController.swift
//  ICL Masjid
//
//  Created by Wajid K Patan on 4/12/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import UIKit

class ICLProjectViewController: UIViewController {
  let underConstLabel: UILabel = Components.descriptionLable(text: "Under Construction")
  // Initialize an array for your pictures
  var picArray = [UIImage]()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "ICL Project Updates"
    // UIImageView in your ViewController
    let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 600))

    view.addSubview(imageView)

    /* let storage = Storage.storage()
     // Create a storage reference from our storage service
     let storageRef = storage.reference()
     // Reference to an image file in Firebase Storage
     let reference = storageRef.child("images/0.JPG")

     print(reference)
     // Placeholder image
     let placeholderImage = UIImage(named: "placeholder.jpg")

     // Load the image using SDWebImage
     imageView.sd_setImage(with: reference, placeholderImage: placeholderImage)*/

    downloadImages(folderPath: "majidimages", success: { img in
      print(img)
      imageView.image = img
    }) { error in
      print(error)
    }
  }

  func downloadImages(folderPath: String, success: @escaping (_ image: UIImage) -> Void, failure: @escaping (_ error: Error) -> Void) {
    for i in 0 ..< 3 {
      // Create a reference with an initial file path and name
      let reference = Storage.storage().reference(withPath: "\(folderPath)/\(i).JPG")
      reference.getData(maxSize: 1 * 1024 * 1024) { data, error in
        if let _error = error {
          print(_error)
          failure(_error)
        } else {
          if let _data = data {
            let myImage: UIImage! = UIImage(data: _data)
            success(myImage)
            self.picArray.append(myImage)
            print(self.picArray)
          }
        }
      }
    }
  }
}
