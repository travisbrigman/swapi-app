//
//  SWAPIApp.swift
//  SWAPI
//
//  Created by Travis Brigman on 1/28/23.
//

import SwiftUI
private var reqresService = ReqresService()
@main
struct SWAPIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: ContentViewModel(reqresService: reqresService))
        }
    }
}
