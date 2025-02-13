//
//  Enums.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import Foundation

enum Endpoint {
  case search
  case details
}

enum HTTPMETHOD: String {
    case GET = "get"
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

enum SearchType {
  case notFound
  case firsState
}

enum FocusedField {
  case search
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
