//
//  File.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-08.
//

import Foundation
import SwiftUI
import AVFoundation

extension Color {
  static let greenLight = Color("ColorGreenLight")
  static let greenDark = Color("ColorGreenDark")
  static let blackLight = Color("ColorBlackLight")
  static let blackDark = Color("ColorBlackDark")
  static let pinkLight = Color("ColorPinkLight")
  static let pinkDark = Color("ColorPinkDark")
  static let blueLight = Color("ColorBlueLight")
  static let blueDark = Color("ColorBlueDark")
  static let yellowLight = Color("ColorYellowGreen")
  
}

// MARK: - Theme
func getBackgroundView(theme: String) -> some View {
    switch theme {
    case "Green":
        return AnyView(GreenBackgroundView())
    case "Pink":
        return AnyView(PinkBackgroundView())
    case "Black":
        return AnyView(BlackBackgroundView())
    default:
        return AnyView(BlueBackgroundView())
    }
}

// MARK: - Audio Player
//class SoundPlayer {
//    static var player: AVAudioPlayer?
//
//    static func playSound(named soundName: String) {
//        if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
//            do {
//                player = try AVAudioPlayer(contentsOf: url)
//                player?.play()
//            } catch {
//                print("Kunde inte spela ljudet: \(error.localizedDescription)")
//            }
//        }
//    }
//}
class SoundPlayer {
    static var player: AVAudioPlayer?

    static func playSound(named soundName: String) {
        if let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Kunde inte spela ljudet: \(error.localizedDescription)")
            }
        }
    }
}
