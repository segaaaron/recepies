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
  @Published var searchFood: [RecepieResponse] = []
  private var apiService = Service()
  func fetchrecepiesData() {
    apiService.fetchData(type: [RecepieResponse].self)
      .sink { completion in
        switch completion {
        case .failure(let err):
          debugPrint("Error is \(err.localizedDescription)")
        case .finished:
          debugPrint("Finished")
        }
      }
    receiveValue: { [weak self] response in
      self?.recepies = response.compactMap { $0 }
      self?.searchFood = response.compactMap { $0 }
    }
    .store(in: &cancellables)
  }
  func fetchSearchData(_ query: String) {
    searchFood = recepies
      .filter { $0.name.lowercased().contains(query.lowercased()) }
  }
  
  func clearData() {
    searchFood = recepies
      .compactMap { $0 }
  }
}
