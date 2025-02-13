//
//  HomeView.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel = HomeViewModel()
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        LazyVStack {
          ForEach(viewModel.recepies, id: \.id) { recepie in
            Text(recepie.name)
          }
        }
        .onAppear {
          viewModel.fetchrecepiesData()
        }
      }
      .navigationTitle(AppConfig.title)
    }
  }
}

#Preview {
  HomeView()
}
