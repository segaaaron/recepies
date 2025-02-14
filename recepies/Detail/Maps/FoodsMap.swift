//
//  FoodsMap.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import SwiftUI
import GoogleMaps

struct FoodsMapView: UIViewRepresentable {
  let longitude : Double
  let latitude : Double
  let marker : GMSMarker = GMSMarker()

  /// Creates a `UIView` instance to be presented.
  func makeUIView(context: Self.Context) -> GMSMapView {
    let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 10.0)
    let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    mapView.mapType = .normal
    return mapView
  }
  
  /// Updates the presented `UIView` (and coordinator) to the latest
  func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
    // Creates a marker in the center of the map.
    marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

    marker.title = "Sydney"
    marker.snippet = "Australia"
    marker.map = mapView
  }
}
