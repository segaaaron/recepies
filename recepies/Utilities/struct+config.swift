//
//  struct+config.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import Foundation

struct AppConfig {
  static let apiKeyName: String = "Apiservice"
  static let googleKeyName: String = "MapKey"
  /// Navigation title
  static let title = "Recepies"
  /// Search content
  static let titleSearch = "Still no searches?"
  static let subtitleSearch = "At least 3 characters are required for your search"
  static let noFoundMessageSearch = "Sorry, we couldn't find what you were looking for."
  static let placeholder = "Search a recepie"
  /// Detail cornerRadius
  static let cornerRadius: CGFloat = 25
  /// Detail info
  static let infoRecepie: String = "Información de la receta"
  static let infoCook: String = "Ingredientes"
}
