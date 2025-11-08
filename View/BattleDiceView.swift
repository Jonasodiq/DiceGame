//
//  BattleDiceView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-07.
//

import SwiftUI

struct BattleDiceView: View {
  
  // MARK: - PROPERTIES
  @AppStorage("colorTheme") private var colorTheme = "Blue"

  @State private var player = 1
  @State private var ai = 1
  @State private var resultText = "Tryck på 'Roll'"
  @State private var playerScore = 0
  @State private var aiScore = 0
  @State private var animatePlayerDice = false
  @State private var animateAIDice = false
  
  // MARK: - BODY
    var body: some View {
      ZStack {
//       PinkBackgroundView()
        getBackgroundView(theme: colorTheme)
        
        VStack {
          Spacer()
          
          // MARK: - TITLE
          Text(" 👤 Du   ⚔️    AI 🤖")
            .font(.title)
          Spacer()
          
          HStack(spacing: 40) {
            VStack {
              Text("👤")
                .font(.system(size: 60))
              Text("Poäng: \(playerScore)")
              
              Image(systemName: "die.face.\(player).fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(animatePlayerDice ? -360 : 0))
                .padding()
            } //: - VStack
            .animation(.easeInOut(duration: 0.5), value: animatePlayerDice)
            
            VStack {
              Text("🤖")
                .font(.system(size: 60))
              Text("Poäng: \(aiScore)")
              
              Image(systemName: "die.face.\(ai).fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.orange)
                .rotationEffect(.degrees(animateAIDice ? 360 : 0))
                .padding()
            }  //: - VStack
            .animation(.easeInOut(duration: 0.5), value: animateAIDice)
          }  //: - NavStack
          Text(resultText)
            .padding()
          
          Spacer()

          // MARK: - BUTTON
          Button("Roll") {
            
            resultText = "Du kastar 🎲"
            playerSound(sound: "dice", type: "mp3")
            
            // 1. Spelarens kast + animation
            animatePlayerDice.toggle()
            player = Int.random(in: 1...6)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
              animatePlayerDice.toggle()
              resultText = "AI kastar 🎲"
            }

            // 2. AI kastar efter 3 sek
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
              animateAIDice.toggle()
              ai = Int.random(in: 1...6)
              playerSound(sound: "dice", type: "mp3")
              
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                animateAIDice.toggle()
                
                // 3. Resultatet visas
                if player > ai {
                  resultText = "🎉 Du vann!"
                  playerScore += 1
                } else if player < ai {
                  resultText = "AI vann! 😞"
                  aiScore += 1
                } else {
                  resultText = "Oavgjort! 🤝"
                }
              }
            }
          } //: - Button
          
          Spacer()
        } //: - VStack
        .buttonStyle(.borderedProminent)
        .foregroundColor(.white)
        .font(.title2)
        .bold(true)
      } //: - ZStack
      .shadow(radius: 20)
    } //: - Body
}

// MARK: - PREVIEW
#Preview {
    BattleDiceView()
}
