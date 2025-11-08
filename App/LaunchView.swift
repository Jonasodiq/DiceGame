//
//  LaunchView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-08.
//

import SwiftUI

struct LaunchView: View {
    // MARK: - PROPERTIES
  @AppStorage("colorTheme") private var colorTheme = "Blue"
  
    @State private var animate = false
    @State private var showMainView = false
    @State private var rotationAngle: Double = 0

    // MARK: - BODY
    var body: some View {
        ZStack {
//            GreenBackgroundView()
          getBackgroundView(theme: colorTheme)
            VStack {
                Spacer()

                Text("Dice")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(animate ? 1 : 0.3)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animate)

                Text("Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(animate ? 1 : 0.3)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animate)

                Spacer()

                Image("image-screen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .scaleEffect(animate ? 1.3 : 0.8)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: rotationAngle)
                    
                Spacer()
            } //: - VStack
            .shadow(radius: 20)
        } //: - ZStack
        .onAppear {
            animate = true
            withAnimation { rotationAngle = 360 }
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                showMainView = true
            }
        }
        .fullScreenCover(isPresented: $showMainView) {
            ContentView()
        }
    }
}

// MARK: - PREVIEW
#Preview {
    LaunchView()
}
