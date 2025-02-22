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
    NavigationStack {
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
          .overlay(
            RoundedRectangle(cornerRadius: 5)
              .fill(Color.black)
              .frame(height: 500)
              .frame(maxWidth: .infinity)
              .opacity(0.2)
            , alignment: .topLeading
          )
          
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
              
              NavigationLink {
                FoodsMapView(longitude: Double(recepieDetail.coordinateRecepie.longitude) ?? 0.0, latitude: Double(recepieDetail.coordinateRecepie.latitude) ?? 0.0, country: recepieDetail.country, name: name)
              } label: {
                Text(AppConfig.mapsTitle)
                  .font(.headline)
                  .fontWeight(.bold)
                  .fontDesign(.serif)
                  .foregroundColor(Color.white)
                  .padding()
                  .background(
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                      .fill(Color.customBlue.b1)
                  )
                  .overlay(
                    RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                      .stroke(Color.clear, lineWidth: 1.0)
                  )
                  .padding(.top, 10)
              }
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
    .navigationBarColor(backgroundColor: Color.customBlue.b3, titleColor: .white)
  }
}

#Preview {
  DetailRecepieView(recepieDetail: ProductDetail(), name: "Arepa")
}
