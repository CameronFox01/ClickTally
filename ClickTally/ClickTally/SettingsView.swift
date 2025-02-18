//
//  SettingsView.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/18/25.
//


import SwiftUI

struct SettingsView: View {
    @AppStorage("incrementValue") private var incrementValue: Int = 1
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
                                .frame(width: 40)
                                .multilineTextAlignment(.center)
                                .padding()
            }
            Spacer()
        }
        .navigationTitle("Settings") // Adds a title to the navigation bar
    }
}

#Preview {
    SettingsView()
}
