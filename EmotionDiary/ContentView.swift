//
//  ContentView.swift
//  EmotionDiary
//
//  Created by hoseung Lee on 2022/05/15.
//

import SwiftUI
import EDUIKit
import FileSystem

struct ContentView: View {
  @State var count: Int = 0
  var body: some View {
    EmotionButton(
      title: "즐거워",
      count: $count) {
      Image(systemName: "house.fill")
    }
      .onAppear{
        let fs = FileSystem().defaultURL
        print(fs)
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
