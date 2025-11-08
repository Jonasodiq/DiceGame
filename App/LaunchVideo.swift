//
//  LaunchVideoView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-09.
//

import SwiftUI
import AVKit

struct LaunchVideoView: View {
    // MARK: - PROPERTIES
    @State private var showMainView = false

    @State private var player = AVPlayer(url: Bundle.main.url(forResource: "intro", withExtension: "mp4")!)

    // MARK: - BODY
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .onAppear {
                    // Spela videon automatiskt
                    player.play()
                    player.isMuted = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        showMainView = true
                    }
                }
        }
        .fullScreenCover(isPresented: $showMainView) {
            ContentView()
        }
    }
}

// MARK: - PREVIEW
#Preview {
    LaunchVideoView()
}

