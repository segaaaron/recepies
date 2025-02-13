//
//  Extension+View.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/13/25.
//

import SwiftUI

extension View {
  func isHidden(_ isHidden: Bool) -> some View {
    modifier(HiddenViewModifier(isHidden: isHidden))
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
