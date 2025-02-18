//
//  SettingsView.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/18/25.
//


import SwiftUI

struct SettingsView: View {
    @AppStorage("incrementValue") private var incrementValue: Int = 1
    @AppStorage("darkMode") private var darkMode = false
    
    @Environment(\.colorScheme) var colorScheme // Detects current mode
    @Environment(\.colorSchemeContrast) var contrastScheme
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding()
            
            HStack{
                Text("Increase by:")
                    .padding()
                TextField("Enter amount", value: $incrementValue, formatter: NumberFormatter())
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.numberPad)
                                .frame(width: 60)
                                .multilineTextAlignment(.center)
                                .padding()
            }
    
            HStack {
                Text("Switch to Dark Mode")
                
                Toggle("", isOn: $darkMode) // Empty label to remove extra space
                    .labelsHidden() // Hides the default label
            }
        
            Spacer()
        }
        .preferredColorScheme(darkMode ? .dark : .light)
        .navigationTitle("Settings") // Adds a title to the navigation bar
    }
}

#Preview {
    SettingsView()
}
