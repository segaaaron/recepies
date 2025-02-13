//
//  RecepieCards.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct RecepieCards: View {
  @Environment(\.colorScheme) var colorScheme
  let recepie: RecepieResponse
  
  var schemaColor: Color {
    colorScheme == .dark ? .white : .black
  }
  
  var body: some View {
    VStack {
      WebImage(url: URL(string: recepie.image)) { image in
        image
          .resizable()
      } placeholder: {
        Rectangle().foregroundColor(.gray)
      }
      .indicator(.activity)
      .frame(height: 300)
      .cornerRadius(20)
      
      Text(recepie.name)
        .font(.largeTitle)
        .fontWeight(.bold)
        .fontDesign(.serif)
        .foregroundColor(schemaColor)
    }
    .frame(height: 420)
    .frame(maxWidth: .infinity)
    .padding([.leading, .trailing], 20)
    .shadow(radius: 2, x: 2, y: 6)
  }
}
