//
//  DiaryViewModel.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

protocol DiaryDisplayLogic {
  func updateDisplay(emotions: [Emotion])
}

protocol DiaryViewModelInterface: ObservableObject {
  var emotions: [Emotion] { get set }
  func increaseEmotion(emotion: Emotion)
}

public final class DiaryViewModel {
  var interactor: DiaryInteractor?

  @Published public var emotions: [Emotion] = []

  public init() {
    interactor?.fetchEmotions()
  }
}

extension DiaryViewModel: DiaryDisplayLogic {
  func updateDisplay(emotions: [Emotion]) {
    self.emotions = emotions
  }
}

extension DiaryViewModel: DiaryViewModelInterface {
  func increaseEmotion(emotion: Emotion) {
    let request = DiaryMessage.Request(emotion: emotion)
    interactor?.increaseEmotion(request: request)
  }
}
