//
//  ClickTallyApp.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/18/25.
//

import SwiftUI

@main
struct ClickTallyApp: App {
    @State private var isBooting: Bool = true
    @AppStorage("darkMode") private var darkMode = true
    
    var body: some Scene {
        WindowGroup {
            if isBooting {
                LaunchScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            isBooting = false
                        }
                    }
                } else {
                    ContentView()
                        .preferredColorScheme(darkMode ? .dark : .light)
                }
        }
    }
}
