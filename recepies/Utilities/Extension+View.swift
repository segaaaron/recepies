//
//  Extension+View.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//
import Foundation
import SwiftUI

extension View {
  func isHidden(_ isHidden: Bool) -> some View {
    modifier(HiddenViewModifier(isHidden: isHidden))
  }
  
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape( RoundedCorner(radius: radius, corners: corners) )
  }
}

struct HiddenViewModifier: ViewModifier {
 let isHidden: Bool
  
  func body(content: Content) -> some View {
    if !isHidden {
      content
        .transition(.opacity)
        .animation(.easeInOut(duration: 0.25), value: isHidden)
    }
  }
}

struct RoundedCorner: Shape {
    let radius: CGFloat
    let corners: UIRectCorner

    init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
