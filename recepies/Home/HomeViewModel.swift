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
  @Published var recepies: [RecepieResponse] = []
  @Published var isLoading: Bool = true
  private var apiService = Service()
  func fetchrecepiesData() {
    apiService.fetchData(type: [RecepieResponse].self)
      .sink { [weak self] completion in
        switch completion {
        case .failure(let err):
          debugPrint("Error is \(err.localizedDescription)")
          self?.isLoading = false
        case .finished:
          debugPrint("Finished")
          self?.isLoading = false
        }
      }
    receiveValue: { [weak self] response in
      self?.recepies = response.compactMap { $0 }
    }
    .store(in: &cancellables)
  }
}
