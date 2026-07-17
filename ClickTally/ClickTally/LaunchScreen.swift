//
//  LaunchScreen.swift
//  ClickTally
//
//  Created by Cameron Fox on 7/3/26.
//


import SwiftUI

struct LaunchScreen: View {
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .gray],
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
            .ignoresSafeArea()

            VStack {
                Image("MyAppIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
