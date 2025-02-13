//
//  PathUrl.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import Foundation

final class ApiUrl {
  func webServiceUrl(_ key: String) -> String {
    guard let path = Bundle.main.path(forResource: "Pathurl", ofType: "plist"),
          let file = NSDictionary(contentsOfFile: path),
          let value = file[key] as? String else {
      return "Not found"
    }
    return value
  }
}
