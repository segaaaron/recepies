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
      VStack {
        Text("Hello world")
      }
    }
}

#Preview {
    HomeView()
}
