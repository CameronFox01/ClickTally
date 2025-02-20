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
    @AppStorage("soundOn") private var soundOn: Bool = true

    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            VStack {
                Text("Settings")
                    .font(.system(size: 50))
                    .frame(maxWidth: .infinity, alignment: .top)
                    .multilineTextAlignment(.center)
                    .padding()

                if isLandscape {
                    HStack {
                        VStack {
                            toggleOption(label: "Sound Effects", binding: $soundOn)
                            toggleOption(label: "Dark Mode", binding: $darkMode)
                        }
                        .frame(maxWidth: geometry.size.width * 0.40)
                    
                        VStack {
                            incrementField()
                        }
                        .frame(maxWidth: geometry.size.width * 0.5)
                    }
                } else {
                    incrementField()
                    toggleOption(label: "Sound Effects", binding: $soundOn)
                    toggleOption(label: "Dark Mode", binding: $darkMode)
                }
                
                Spacer()
            }
            .preferredColorScheme(darkMode ? .dark : .light)
            .navigationTitle("Settings")
        }
    }
    
    /// Function to create a labeled Toggle switch
    private func toggleOption(label: String, binding: Binding<Bool>) -> some View {
        HStack {
            Text(label)
            Toggle("", isOn: binding)
                .labelsHidden()
        }
    }
    
    /// Function to create the increment input field
    private func incrementField() -> some View {
        HStack {
            Text("Increase by:")
                .padding()
            TextField("Enter amount", value: $incrementValue, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .frame(width: 60)
                .multilineTextAlignment(.center)
                .onTapGesture {
                    incrementValue = 0
                }
        }
    }
}


#Preview {
    SettingsView()
}
