//
//  ContentView.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var counted = 0 // Use @State to track changes
    @Environment(\.colorScheme) var colorScheme // Detects light/dark mode
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    HStack{
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear.circle")
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                                .font(.system(size: 45))
                        }
                        
                        Spacer()
                        //Reset Button
                        Button(action: {
                            if( counted != 0){
                                counted = 0;
                            }
                        }) {
                            Text("Reset")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .padding() // Adds spacing inside the box
                                .background(Color.red) // Background color of the box
                                .cornerRadius(10) // Rounded corners
                        }
                    }
                    .padding(.top, 35)
                    .padding(.horizontal)
                    
                    //Main Text
                    Text("\(counted)")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.system(size: 100))
                    
                    Spacer() // Pushes the button down
                    //Plus Button
                    Button(action: {
                        counted += 1;
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 100))
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 50) // Keeps it 50 points above the bottom
                    
                    //Minus Button
                    Button(action: {
                        if( counted != 0){
                            counted -= 1;
                        }
                    }) {
                        Image(systemName: "minus.rectangle")
                            .foregroundStyle(.red)
                            .font(.system(size: 75))
                    }
                    .padding(.bottom, 50)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Ensures it stretches to full screen
        }
    }
}

#Preview {
    ContentView()
}
