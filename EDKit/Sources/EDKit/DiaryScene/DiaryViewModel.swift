//
//  DiaryViewModel.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

public protocol DiaryDisplayLogic {
  func updateDisplay(emotions: [Emotion])
}

public protocol DiaryViewModelInterface: ObservableObject {
  var emotions: [Emotion] { get set }
  func increaseEmotion(emotion: Emotion)
  func fetchEmotions()
}

public final class DiaryViewModel {
  public var interactor: DiaryInteractor?

  @Published public var emotions: [Emotion] = []

  public init() {
    interactor?.fetchEmotions()
  }

  public func fetchEmotions() {
    interactor?.fetchEmotions()
  }
}

extension DiaryViewModel: DiaryDisplayLogic {
  public func updateDisplay(emotions: [Emotion]) {
    self.emotions = emotions
  }
}

extension DiaryViewModel: DiaryViewModelInterface {
  public func increaseEmotion(emotion: Emotion) {
    let request = DiaryMessage.Request(emotion: emotion)
    interactor?.increaseEmotion(request: request)
  }
}
