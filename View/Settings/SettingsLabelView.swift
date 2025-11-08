//
//  SettingsLabelView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-10.
//

import SwiftUI

struct SettingsLabelView: View {
  // MARK: - PROPERTIES
  
  var labelText: String
  var labelImage: String

  // MARK: - BODY

  var body: some View {
    HStack {
      Text(labelText.uppercased())
        .fontWeight(.bold)
      Spacer()
      Image(systemName: labelImage)
        .font(.title)
    }
    .foregroundColor(.blue)
  }
}

#Preview {
  SettingsLabelView(labelText: "Text", labelImage: "info.circle")
    .padding()
}
