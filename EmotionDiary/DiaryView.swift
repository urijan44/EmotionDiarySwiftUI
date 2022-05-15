//
//  DiaryView.swift
//  EmotionDiary
//
//  Created by hoseung Lee on 2022/05/15.
//

import SwiftUI
import EDUIKit
import EDKit

struct DiaryView<ViewModel: DiaryViewModelInterface>: View {

  @ObservedObject var viewModel: ViewModel

  private var columns: [GridItem] = [
    GridItem(.adaptive(minimum: 50, maximum: .infinity), spacing: 9),
    GridItem(.adaptive(minimum: 50, maximum: .infinity), spacing: 9),
    GridItem(.adaptive(minimum: 50, maximum: .infinity), spacing: 9),
  ]

  var body: some View {
    ZStack {
      BackgroundView
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(viewModel.emotions, id: \.id) { emotion in
          EmotionButton(emotion: emotion) {
            Image(emotion.title)
          } handler: { emotion in
            viewModel.increaseEmotion(emotion: emotion)
          }
        }
      }
      .padding()
    }
    .onAppear {
      viewModel.fetchEmotions()
    }
  }

  @ViewBuilder
  var BackgroundView: some View {
    Image("Heart")
      .resizable()
      .opacity(0.4)
      .aspectRatio(contentMode: .fit)
  }

  init(viewModel: ViewModel) {
    self.viewModel = viewModel
  }
}
