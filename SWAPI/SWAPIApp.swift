//
//  SWAPIApp.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
private var reqresService = ReqresService()
@main
struct SWAPIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(vm: ContentViewModel(reqresService: reqresService))
        }
    }
}
