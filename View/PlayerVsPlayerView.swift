//
//  PlayerVsPlayerView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-09.
//

import SwiftUI
import AVFoundation

struct PlayerVsPlayerView: View {
  
  // MARK: - PROPERTIES
  @AppStorage("colorTheme") private var colorTheme = "Blue"

  @State private var player1Roll = 1
  @State private var player2Roll = 1
  @State private var player1Score = 0
  @State private var player2Score = 0
  @State private var turn = true
  @State private var resultText = "👤 Player 1 \n🎲  börjar!"
  @State private var animateDice = false
  @State private var gameOver = false
  
    // MARK: - BODY
  var body: some View {
    ZStack {
//       PinkBackgroundView()
      getBackgroundView(theme: colorTheme)
      
     VStack {
         Spacer()
       
       // MARK: - TITLE
         Text("👤 Player 1    ⚔️    Player 2 👤")
         .font(.title)

       Text("🎯 Mål = 21")
         .padding(.top)
       
         HStack(spacing: 40) {
           // MARK: - PLAYER 1
           VStack {
             Image(systemName: "person.fill")
             .resizable()
             .frame(width: 70, height: 70)

             Text("Totalt: \(player1Score)")
               .font(.system(size: 20))
             
             Image(systemName: "die.face.\(player1Roll).fill")
               .resizable()
               .frame(width: 70, height: 70)
               .rotationEffect(.degrees(turn && animateDice ? 360 : 0))
           } //: - VStack
           .foregroundColor(.green)
           
           // MARK: - PLAYER 1
           VStack {
             Image(systemName: "person.fill")
               .resizable()
               .frame(width: 70, height: 70)
             Text("Totalt: \(player2Score)")
             Image(systemName: "die.face.\(player2Roll).fill")
                 .resizable()
                 .rotationEffect(.degrees(!turn && animateDice ? 360 : 0))
                 .frame(width: 70, height: 70)
           } //: - VStack
           .foregroundColor(.teal)
         } //: - HStack
         .animation(.easeInOut(duration: 0.4), value: animateDice)
         .fontWeight(.black)
         
         Text(resultText)
             .padding()
         
         Spacer()
         
       // MARK: - BUTTON ROLL
       Button("🎲 Roll") {
          guard !gameOver else { return }
          animateDice.toggle()
          playerSound(sound: "dice", type: "mp3")
          let roll = Int.random(in: 1...6)
           
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
           if turn {
             player1Roll = roll
             player1Score += roll
             if player1Score == 21 {
               playerSound(sound: "wind", type: "mp3")
               resultText = "👤 Player 2 - vinner!  🏆\n👤 Player 1 - förlorade!💥"
                 resultText = "👤 Player 1 VANN!🎯"
                 gameOver = true
             } else if player1Score > 21 {
               DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                 playerSound(sound: "wind", type: "mp3")
                 resultText = "👤 Player 2 - vinner!  🏆\n👤 Player 1 - förlorade!💥"
                 }
                 gameOver = true
             } else {
                 resultText = "👤 Player 1 \n🎲 kastade \(roll)."
                 turn.toggle()
             }
           } else {
             player2Roll = roll
             player2Score += roll
             if player2Score == 21 {
               playerSound(sound: "wind", type: "mp3")
               resultText = "👤 Player 2 - vinner!  🏆\n👤 Player 1 - förlorade!💥"
                 resultText = "👤 Player 2 VANN!🎯"
                 gameOver = true
             } else if player2Score > 21 {
               DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                 playerSound(sound: "wind", type: "mp3")
                 resultText = "👤 Player 1  - vinner!  🏆\n👤 Player 2 - förlorade!💥"
                 }
                 gameOver = true
             } else {
                 resultText = "👤 Player 2 \n🎲 kastade \(roll)."
                 turn.toggle()
             }
           }
         }
       }
       .padding()
         
       // MARK: - BUTTON RESET
         Button("🔄 RESET") {
           player1Roll = 1
           player2Roll = 1
           player1Score = 0
           player2Score = 0
           turn = true
           resultText = "👤 Player 1 \n🎲  börjar!"
           gameOver = false
         }
         
         Spacer()
     }
     .buttonStyle(.borderedProminent)
     .foregroundColor(.white)
     .font(.title2)
     .bold(true)
    } //: - VStack
    .shadow(radius: 10)
  } //: - ZStack
}

// MARK: - PREVIEW
#Preview {
    PlayerVsPlayerView()
}
