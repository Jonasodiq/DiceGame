//
//  CustomBackgroundView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-08.
//

import SwiftUI

struct BlackBackgroundView: View {
    var body: some View {
      ZStack {
        
        RadialGradient(
          gradient: Gradient(colors: [.blackLight, .blackDark]),
          center: .center,
          startRadius: 0,
          endRadius: 400
        )
        .edgesIgnoringSafeArea(.all)
        
//        Circle()
//          .fill(Color.greenLight)
//          .frame(width: 200, height: 200)
//          .shadow(color: Color.greenDark.opacity(1), radius: 30)
      }
          
        
    }
}

#Preview {
  BlackBackgroundView()
}
