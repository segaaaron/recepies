//
//  HomeViewModel.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
  private var cancellables = Set<AnyCancellable>()
  private var url = ApiUrl()
  func fetchrecepiesData() {
  }
}
