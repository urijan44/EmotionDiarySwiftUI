//
//  ContentView.swift
//  EmotionDiary
//
//  Created by hoseung Lee on 2022/05/15.
//

import SwiftUI
import EDUIKit
import EDKit
import FileSystem

struct ContentView: View {
  let appContainer = AppContainer()
  var body: some View {
    appContainer.makeDiaryView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


