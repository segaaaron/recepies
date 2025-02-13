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
        LazyVStack(spacing: 0) {
          ForEach(viewModel.recepies, id: \.id) { recepie in
            RecepieCards(recepie: recepie)
  
            Divider()
              .border(Color.gray, width: 2)
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
