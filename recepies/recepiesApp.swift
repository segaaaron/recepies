//
//  recepiesApp.swift
//  recepies
//
//  Created by Miguel Angel Saravia Belmonte on 2/12/25.
//

import SwiftUI

@main
struct recepiesApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  var body: some Scene {
    WindowGroup {
      HomeView()
    }
  }
}
