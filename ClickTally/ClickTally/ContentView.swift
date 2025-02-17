//
//  ContentView.swift
//  ClickTally
//
//  Created by Cameron Fox on 2/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var counted = 0 // Use @State to track changes
    var body: some View {
        VStack {
            Button(action: {
                if( counted != 0){
                    counted -= 1;
                }
            }) {
                Image(systemName: "minus.rectangle")
                    .foregroundStyle(.red)
                    .font(.system(size: 50))
            }
            
            Text("\(counted)")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.system(size: 100))
            
            Spacer() // Pushes the button down

            Button(action: {
                counted += 1;
            }) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 100))
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 50) // Keeps it 50 points above the bottom
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Ensures it stretches to full screen
    }
}

#Preview {
    ContentView()
}
