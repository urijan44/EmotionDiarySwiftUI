//
//  EmotionButton.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import SwiftUI
import Combine
import EDKit

public struct EmotionButton: View {

  //MARK: - Properties
  @ObservedObject var viewModel: ViewModel
  var image: () -> Image
  var handler: (Emotion) -> Void
  @State var xOffset: CGFloat = 0
  public var body: some View {
    ContentView
    .onTapGesture {
      tapAction()
    }
  }

  @ViewBuilder
  var ContentView: some View {
    VStack {
      image()
        .resizable()
        .aspectRatio(contentMode: .fit)
        .offset(x: xOffset, y: 0)
      HStack {
        Text(viewModel.title)
        Text(viewModel.count)
      }
      .foregroundColor(.black)
    }
  }

  //MARK: - Methods
  public init(
    emotion: Emotion,
    @ViewBuilder image: @escaping () -> Image,
    handler: @escaping (Emotion) -> Void
  ) {
      self.viewModel = ViewModel(emotion: emotion)
      self.image = image
      self.handler = handler
  }

  private func tapAction() {
    xOffset = 10
    handler(viewModel.emotion)
    withAnimation(.spring(response: 0.15, dampingFraction: 0.25, blendDuration: 0.1)) {
      xOffset = 0
    }
  }
}

extension EmotionButton {
  final class ViewModel: ObservableObject {
    @Published var emotion: Emotion
    @Published var count: String = "0"
    @Published var title: String = ""

    init(emotion: Emotion) {
      self.emotion = emotion
      self.count = updateCountLabel()
      self.title = emotion.title
    }

    func increaseCount() {
      emotion.increase()
      self.count = updateCountLabel()
    }

    private func updateCountLabel() -> String {
      return emotion.count > 1000 ? "999" : "\(emotion.count)"
    }
  }
}
