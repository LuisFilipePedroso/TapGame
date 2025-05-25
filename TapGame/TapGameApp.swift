//
//  TapGameApp.swift
//  TapGame
//
//

import SwiftUI
import XcodebuildNvimPreview

@main
struct TapGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .setupNvimPreview { ContentView() }
        }
    }
}
