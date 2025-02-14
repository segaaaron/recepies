//
//  HomeView.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var viewModel = HomeViewModel()
  @State var text: String = ""
  
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        SearchInput(text: $text, placeholder: AppConfig.placeholder)
          .onChange(of: text) { _ , value in
            switch value {
            case let query where query.isEmpty:
              viewModel.clearData()
            case let query where query.count > 2:
              viewModel.fetchSearchData(value)
            default:
              break
            }
          }
        
        switch viewModel.searchFood {
        case let search where search.isEmpty:
          Emptystate(EmptpyStateType: .notFound)
        default:
          EmptyView()
        }
        
        LazyVStack(spacing: 0) {
          ForEach(viewModel.searchFood, id: \.id) { recepie in
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
        .onDisappear {
          text = ""
        }
      }
      .navigationTitle(AppConfig.title)
      .navigationBarColor(backgroundColor: Color.customBlue.b3, titleColor: .white)
    }
    .accentColor(Color.white)
  }
}

#Preview {
  HomeView()
}
