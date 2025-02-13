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
            NavigationLink {
              DetailRecepieView(recepieDetail: recepie.productDetail, name: recepie.name)
            } label: {
              RecepieCards(recepie: recepie)
              
              Divider()
                .border(Color.gray, width: 2)
            }
          }
        }
        .onAppear {
          viewModel.fetchrecepiesData()
        }
      }
      .navigationTitle(AppConfig.title)
      .navigationBarColor(backgroundColor: Color.customBlue.b3, titleColor: .white)
    }
  }
}

#Preview {
  HomeView()
}
