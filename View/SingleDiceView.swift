//
//  SingleDiceView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-07.
//

import SwiftUI
import AVFoundation

struct SingleDiceView: View {
  
  // MARK: - PROPERTIES
  @AppStorage("targetScore") private var targetScore = 21
  @AppStorage("colorTheme") private var colorTheme = "Blue"
  
  @State private var diceCount = 1
  @State private var diceValues = [1]
  @State private var totalScore = 0
  @State private var animate = false
  @State private var resultText = ""
  

  // MARK: - BODY
  var body: some View {
    ZStack {
      getBackgroundView(theme: colorTheme)

      VStack {
          Spacer()
          
          // MARK: - TITLE
          Text("Enkel Tärning")

          Text("Totalt: \(totalScore)")
            .font(.title2)
            .padding()

          Text(resultText)
            .font(.title3)
            .foregroundColor(.yellow)
            .multilineTextAlignment(.center)
          
          Spacer()

          Picker("Antal tärningar", selection: $diceCount) {
            ForEach(1...4, id: \.self) { count in
             Text("\(count) = 🎲")
            }
          }
          .pickerStyle(.palette)
          .padding(24)
          .onChange(of: diceCount) {
              playerSound(sound: "click", type: "mp3")
          }

        // MARK: - DICE
          HStack {
            ForEach(diceValues, id: \.self) { value in
              Image(systemName: "die.face.\(value).fill")
                .resizable()
                .frame(width: 70, height: 70)
                .foregroundColor(.blue)
                .rotationEffect(.degrees(animate ? 360 : 0))
                .animation(.easeInOut(duration: 0.4), value: animate)
            }
          } //: - HStack
            Spacer()
          
          // MARK: - BUTTON ROLL
          Button("Roll") {
            guard totalScore < targetScore else { return }
            animate.toggle()
            playerSound(sound: "dice", type: "mp3")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
              diceValues = (0..<diceCount).map { _ in Int.random(in: 1...6) }
              let roundScore = diceValues.reduce(0, +)
              totalScore += roundScore
              animate.toggle()

              // Vinst/förlust-logik
              if totalScore == targetScore {
                resultText = "Du vann! 🎯 \nExakt \(targetScore) poäng!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                  playerSound(sound: "wind", type: "mp3")
                  }
              } else if totalScore > targetScore {
                resultText = "Du fick \(totalScore)...💥 \nFörsök igen!"
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                  playerSound(sound: "over", type: "mp3")
                  }
              } else {
                resultText = "Du fick \(roundScore). \nFortsätt rolla!"
              }
            } // Dispatch
          } //: - Button Roll
          .padding()

          // MARK: - BUTTON RECET
          Button(" 🔄 ") {
            totalScore = 0
            diceValues = [1]
            resultText = "🎯 Mål = \(targetScore)"
          }
          
          Spacer()
        
      } //: - VStack
      .buttonStyle(.borderedProminent)
      .foregroundColor(.white)
      .font(.title)
      .bold(true)
      .onAppear {
        resultText = "🎯 Mål = \(targetScore)"
      }
    } //: - ZStack
  } //: - Body
}

// MARK: - PREVIEW
#Preview {
  SingleDiceView()
}

