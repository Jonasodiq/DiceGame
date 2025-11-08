//
//  SoundPlayer.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-10.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playerSound(sound: String, type: String) {
  let isSoundEnabled = UserDefaults.standard.bool(forKey: "isSoundEnabled")
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("Error playing sound: \(error)")
    }
  }
}
