//
//  SettingsView.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/18/25.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
            
            Text("Here you can add your settings options.")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Settings") // Adds a title to the navigation bar
    }
}

#Preview {
    SettingsView()
}
