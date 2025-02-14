//
//  Model.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

struct RecepieResponse: Codable, Hashable {
    let id, name: String
    let image: String
    let productDetail: ProductDetail
  
  init(id: String = "", name: String = "", image: String = "", productDetail: ProductDetail = ProductDetail()) {
    self.id = id
    self.name = name
    self.image = image
    self.productDetail = productDetail
  }
}

// MARK: - ProductDetail
struct ProductDetail: Codable, Hashable {
    let posterImage: String
    let coordinateRecepie: CoordinateRecepie
    let detail, recepieInfo, country, recepieCook: String
  
  init(posterImage: String = "", coordinateRecepie: CoordinateRecepie = CoordinateRecepie(), detail: String = "", recepieInfo: String = "", recepieCook: String = "", country: String = "") {
    self.posterImage = posterImage
    self.coordinateRecepie = coordinateRecepie
    self.detail = detail
    self.recepieInfo = recepieInfo
    self.recepieCook = recepieCook
    self.country = country
  }
}

// MARK: - CoordinateRecepie
struct CoordinateRecepie: Codable, Hashable {
  let latitude: String
  let longitude: String
  
  init(latitude: String = "", longitude: String = "") {
    self.latitude = latitude
    self.longitude = longitude
  }
}
