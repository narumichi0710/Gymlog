//
//  MainApp.swift
//  App
//
//  Created by Narumichi Kubo on 2023/05/03.
//

import SwiftUI
import AppFeature
import FirebaseCore

@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

public class AppDelegate: NSObject, UIApplicationDelegate {
  public func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
      FirebaseApp.configure()
      return true
  }
}
