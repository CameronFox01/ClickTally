//
//  ContentView.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/16/25.
//

import SwiftUI
import Foundation
struct ContentView: View {
    @AppStorage("counted") private var counted = 0
    @AppStorage("incrementValue") private var incrementValue: Int = 1
    @AppStorage("darkMode") private var darkMode = false
    @Environment(\.colorScheme) var colorScheme
    @State private var currentColorScheme: ColorScheme?
    
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            
            NavigationStack {
                ZStack {
                    VStack {
                        HStack {
                            NavigationLink(destination: SettingsView()) {
                                Image(systemName: "gear.circle")
                                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                                    .font(.system(size: isLandscape ? 60 : 50))
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                if counted != 0 {
                                    counted = 0
                                }
                            }) {
                                Text("Reset")
                                    .foregroundColor(.white)
                                    .font(.system(size: isLandscape ? 30 : 30))
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.top, isLandscape ? 35 : 35)
                        .padding(.horizontal, 30)
                        
                        // Main Counter Text
                        Text("\(counted)")
                            .font(.system(size: isLandscape ? 80 : 100))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        Spacer()
                        var landscape = isLandscape
                        if(landscape){
                            HStack{
                                // Minus Button
                                Button(action: {
                                    if counted != 0 {
                                        counted -= incrementValue
                                    }
                                }) {
                                    Image(systemName: "minus.rectangle")
                                        .foregroundStyle(.red)
                                        .font(.system(size: 60))
                                }
                                .padding(.bottom, 50)
                                // Plus Button
                                Button(action: {
                                    counted += incrementValue
                                }) {
                                    Image(systemName: "plus.circle")
                                        .font(.system(size: 70))
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.bottom, 50)
                                
                            }
                        }else {
                            // Plus Button
                            Button(action: {
                                counted += incrementValue
                            }) {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: isLandscape ? 70 : 100))
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.bottom, isLandscape ? 20 : 50)
                            
                            // Minus Button
                            Button(action: {
                                if counted != 0 {
                                    counted -= incrementValue
                                }
                            }) {
                                Image(systemName: "minus.rectangle")
                                    .foregroundStyle(.red)
                                    .font(.system(size: isLandscape ? 50 : 75))
                            }
                            .padding(.bottom, isLandscape ? 20 : 50)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .preferredColorScheme(ClickTally.preferredColorScheme(darkMode: darkMode))
                          
            }
        }
    }
}


#Preview {
    ContentView()
}
