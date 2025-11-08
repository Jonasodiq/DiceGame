//
//  SettingsView.swift
//  DiceGame
//
//  Created by Jonas Niyazson on 2025-04-09.
//

import SwiftUI
import AVFoundation

struct SettingsView: View {
  @AppStorage("targetScore") private var targetScore = 21
  @AppStorage("soundOn") private var soundOn = true
  @AppStorage("colorTheme") private var colorTheme = "Blue"
  
  var body: some View {
    
    Form {
      Section(header: Text("Målpoäng")) {
        Picker("Välj målpoäng", selection: $targetScore) {
          ForEach([11, 21, 30, 50, 100], id: \.self) { value in
            Text("\(value) poäng")
          }
        }
        .pickerStyle(.menu)
      }
      
      Section(header: Text("Ljud")) {
        Toggle("Ljud på", isOn: $soundOn)
      }
      
      
      Section(header: Text("Färgtema")) {
        Picker("Tema", selection: $colorTheme) {
          Text("🟢 Grön").tag("Green")
          Text("🔵 Blå").tag("Blue")
          Text("🟣 Rosa").tag("Pink")
          Text("⚫ Svart").tag("Black")
        }
        .pickerStyle(.segmented)
        .padding(.bottom)
        .onChange(of: colorTheme) {
          playerSound(sound: "click", type: "mp3")
        }
        
        Section {
          Button("🔄 Återställ till standard") {
            targetScore = 21
            soundOn = true
            colorTheme = "Blue"
          }
          .foregroundColor(.black)
        }
        
        
    }
      Section(header: Text("Application")) {
        
        GroupBox(
          
          label:
            SettingsLabelView(labelText: "Dice Game App", labelImage: "dice")
        ) {
          SettingsRowView(name: "Developer", content: "Jonas Niyazson")
          SettingsRowView(name: "Designer", content: "Jonas Niyazson")
          SettingsRowView(name: "Compatibility", content: "iOS 18.2")
          SettingsRowView(name: "Website", linkLabel: "My Portifolio", linkDestination: "https://my-easy-portfolio.netlify.app/")
          SettingsRowView(name: "Twitter", linkLabel: "my@twitter", linkDestination: "twitter.com/")
          SettingsRowView(name: "SwiftUI", content: "5.0")
          SettingsRowView(name: "Version", content: "1.5.0")
        }
      }
    }
    .navigationTitle("Settings")
  }
}
#Preview {
    SettingsView()
}
