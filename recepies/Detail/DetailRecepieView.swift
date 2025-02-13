//
//  DetailRecepie.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct DetailRecepieView: View {
  let recepieDetail: ProductDetail
  let name: String
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        WebImage(url: URL(string: recepieDetail.posterImage)) { image in
          image
            .resizable()
        } placeholder: {
          Rectangle().foregroundColor(.gray)
        }
        .indicator(.activity)
        .frame(height: 500)
        .background(Color.black.opacity(0.6))
        
        VStack {
          VStack(alignment: .leading, spacing: 10) {
            Text(name)
              .font(.title)
              .fontWeight(.bold)
              .fontDesign(.serif)
              .foregroundColor(Color.black)
              .padding(.top, 10)
            
            Text(recepieDetail.detail)
              .font(Font.system(size: 16, weight: .medium))
              .fontDesign(.serif)
              .foregroundColor(Color.black)
            
            Text(AppConfig.infoRecepie)
              .font(.title)
              .fontWeight(.bold)
              .fontDesign(.serif)
              .foregroundColor(Color.black)
              .padding(.top, 10)
            
            Text(recepieDetail.recepieInfo)
              .font(Font.system(size: 16, weight: .semibold))
              .fontDesign(.serif)
              .foregroundColor(Color.black)
            
            Text(AppConfig.infoCook)
              .font(.title)
              .fontWeight(.bold)
              .fontDesign(.serif)
              .foregroundColor(Color.black)
              .padding(.top, 10)
            
            Text(recepieDetail.recepieCook)
              .font(Font.system(size: 16, weight: .semibold))
              .fontDesign(.serif)
              .foregroundColor(Color.black)
          }
          .padding([.leading, .trailing], 10)
          .padding(.bottom, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .padding(.top, -AppConfig.cornerRadius)
      }
      .frame(maxHeight: .infinity)
    }
    .edgesIgnoringSafeArea(.top)
  }
}

#Preview {
  DetailRecepieView(recepieDetail: ProductDetail(), name: "Arepa")
}
