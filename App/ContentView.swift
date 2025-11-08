//
//  ContentView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-07.
//

import SwiftUI

struct ContentView: View {
  
  // MARK: - PROPERTIES
  @AppStorage("colorTheme") private var colorTheme = "Gree"

  
  // MARK: - BODY
  var body: some View {
   
    NavigationStack {
      ZStack {
        getBackgroundView(theme: colorTheme)
   
        VStack {
          Spacer()
          
          // MARK: - TITLE
          Text("Dice")
            .font(.system(size: 70, weight: .bold, design: .rounded))
          Text("Game")
            .font(.system(size: 52, weight: .bold, design: .rounded))
          
          Spacer()
          
          Text("🎲")
            .font(.system(size: 120))
          
          Spacer()
        
          NavigationLink("Enkel tärning 🎯") {
            SingleDiceView()
          }
          .tint(.blue)
          
          NavigationLink("Spela mot AI 🤖") {
             BattleDiceView()
           }
           .tint(.purple)
           .padding()
          
          NavigationLink("Spela mot vän 👥") {
              PlayerVsPlayerView()
          }
          .tint(.brown)
          
          NavigationLink("Inställningar ⚙️") {
              SettingsView()
          }
          .tint(.gray)
          .padding()
         
          Spacer()
          
        } //: - VStack
        .buttonStyle(.borderedProminent)
        .foregroundColor(.white)
        .font(.title)
        .fontWeight(.bold)
        .shadow(radius: 20)
      } //: - ZStack
    } //: - NavStack
  } //: - Body
}

// MARK: - PREVIEW
#Preview {
    ContentView()
}
