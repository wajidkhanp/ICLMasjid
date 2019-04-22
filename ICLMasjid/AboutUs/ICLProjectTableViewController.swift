//
//  ICLProjectTableViewController.swift
//  ICLMasjid
//
//  Created by Wajid K Patan on 4/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import Firebase
import UIKit

class ICLProjectTableViewController: UITableViewController {
  // Initialize an array for your pictures
  var picArray = [UIImage]()
  let reference = Storage.storage().reference(forURL: "gs://iclmasjid.appspot.com/majidimages")
  let imageName: [String] = ["0.JPG", "1.JPG", "2.JPG"]

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.white
    navigationItem.title = "ICL Project"

    tableView.tableFooterView = UIView()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "aboutus001")

    tableView.delegate = self
    tableView.dataSource = self
    tableView.bounces = false
  }

  override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
    return 3
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "aboutus001", for: indexPath)
    let imageURL = reference.child(imageName[indexPath.row])

    imageURL.downloadURL(completion: { url, error in

      if error != nil {
        print(error?.localizedDescription)
        return
      }
      URLSession.shared.dataTask(with: url!, completionHandler: { data, _, error in
        if error != nil {
          print(error!)
          return
        }
        guard let imageData = UIImage(data: data!) else { return }
        DispatchQueue.main.async {
          let cellImg: UIImageView = UIImageView(frame: CGRect(x: 100, y: 5, width: 200, height: 200))
          cellImg.image = imageData
          cell.addSubview(cellImg)
          // cell.imageView!.image = imageData
          // tableView.reloadData()
        }
      }).resume()
    })
    cell.selectionStyle = .none
    return cell
  }

  override func tableView(_: UITableView, didSelectRowAt _: IndexPath) {}

  override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
    return 210
  }

  override func tableView(_: UITableView, estimatedHeightForRowAt _: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }

  func downloadImages(cell: UITableViewCell, folderPath: String, success: @escaping (_ image: UIImage) -> Void, failure: @escaping (_ error: Error) -> Void) {
    for i in 0 ..< 2 {
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
            cell.imageView?.image = myImage
            print(self.picArray)
          }
        }
      }
    }
  }

  func downloadImages(folderPath: String) -> [UIImage] {
    print("inside downlaod images")

    var temPicArray = [UIImage]()

    for i in 0 ..< 2 {
      // Create a reference with an initial file path and name
      let reference = Storage.storage().reference(withPath: "\(folderPath)/\(i).JPG")
      print(reference.debugDescription)
      print(reference)
      reference.getData(maxSize: 10 * 1024 * 1024) { data, error in
        if let _error = error {
          print(_error)

        } else {
          if let _data = data {
            let myImage: UIImage! = UIImage(data: _data)
            print(myImage.debugDescription)
            temPicArray.append(myImage)
            print("Temporray Array")
            print(temPicArray)
          }
        }
      }
    }
    return temPicArray
  }

  func loadArrayOfImages(cell: UITableViewCell, i: Int, folderPath: String) {
    // Create a storage reference from the URL
    let reference = Storage.storage().reference(withPath: "\(folderPath)/\(i).JPG")

    // Download the data, assuming a max size of 1MB (you can change this as necessary)
    reference.getData(maxSize: 10 * 1024 * 1024) { (data, _) -> Void in
      // Create a UIImage, add it to the array
      if let _data = data {
        let myImage: UIImage! = UIImage(data: _data)
        self.picArray.append(myImage!)
        cell.imageView?.image = myImage
        cell.imageView?.contentMode = .scaleToFill
        self.tableView.reloadData()
      }
    }
  }
}
