//
//  MasjidLocationViewController.swift
//  ICL Masjid
//
//  Created by Wajid k Patan on 3/31/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import MapKit
import UIKit

class MasjidLocationViewController: UIViewController, CLLocationManagerDelegate {
  var window: UIWindow?
  var mapView: MKMapView?
  var locationManager: CLLocationManager?
  let distanceSpan: Double = 200
  let annotation = MKPointAnnotation()
  let addressLable: UILabel = Components.descriptionLable(text: GlobalData.iclMasjidAddress)
  let openMapButton: UIButton = Components.butonElement(title: "Let's go to Masjid")

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = UIColor.white
    navigationItem.title = "ICL Majid Address"

    window = UIWindow(frame: UIScreen.main.bounds)
    view.backgroundColor = UIColor.white
    mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: (window?.frame.width)!, height: 400))
    view.addSubview(mapView!)
    view.addSubview(addressLable)
    view.addSubview(openMapButton)

    setUpView()
    openMapButton.addTarget(self, action: #selector(openMapinAnotherView), for: .touchUpInside)

    locationManager = CLLocationManager()
    if let locationManager = self.locationManager {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
      locationManager.requestAlwaysAuthorization()
      locationManager.distanceFilter = 500
      locationManager.startUpdatingLocation()
    }

    coordinates(forAddress: GlobalData.iclMasjidMappAddress) { locationManager in
      guard let location = locationManager else {
        print("error occured in locationManager")
        return
      }
      self.showMasjidLocationOnMap(lat: location.latitude, long: location.longitude)
    }
  }

  func setUpView() {
    addressLable.numberOfLines = 6
    addressLable.font = Font.large01
    addressLable.textAlignment = .justified
    addressLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    addressLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
    addressLable.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    addressLable.heightAnchor.constraint(equalToConstant: 160).isActive = true

    openMapButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
    openMapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    openMapButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
    openMapButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
  }

  @objc func openMapinAnotherView() {
    coordinates(forAddress: GlobalData.iclMasjidMappAddress) { locationManager in
      guard let location = locationManager else {
        // Handle error here.
        return
      }
      self.openMapForPlace1(lat: location.latitude, long: location.longitude)
    }
  }

  func locationManager(manager _: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation _: CLLocation) {
    if let mapView = self.mapView {
      let region = MKCoordinateRegion(center: newLocation.coordinate, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan)
      mapView.setRegion(region, animated: true)
      mapView.showsUserLocation = true
    }
  }

  func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(address) { placemarks, error in
      guard error == nil else {
        print("Geocoding error: \(error!)")
        completion(nil)
        return
      }
      completion(placemarks?.first?.location?.coordinate)
    }
  }

  public func openMapForPlace1(lat: Double = 0, long: Double = 0, placeName: String = "ICL Masjid") {
    let latitude: CLLocationDegrees = lat
    let longitude: CLLocationDegrees = long

    let regionDistance: CLLocationDistance = 100
    let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
    let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
    let options = [
      MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
      MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span),
    ]
    let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = placeName
    mapItem.openInMaps(launchOptions: options)
  }

  public func showMasjidLocationOnMap(lat: Double = 0, long: Double = 0, placeName _: String = "") {
    let latitude: CLLocationDegrees = lat
    let longitude: CLLocationDegrees = long

    let regionDistance: CLLocationDistance = 200
    let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
    annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    annotation.title = "ICL Masjid"
    if let mapView = self.mapView {
      let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
      mapView.setRegion(region, animated: true)
      mapView.showsUserLocation = true
      mapView.mapType = MKMapType.hybrid
      mapView.isZoomEnabled = true
      mapView.addAnnotation(annotation)
    }
  }
}

extension UIBarButtonItem {
  static func menuButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: imageName), for: .normal)
    button.tintColor = UIColor.white
    button.addTarget(target, action: action, for: .touchUpInside)

    let menuBarItem = UIBarButtonItem(customView: button)
    menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
    menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
    menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
    return menuBarItem
  }
}
