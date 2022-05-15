//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

protocol DiaryBusinessLogic {

}

final class DiaryInteractor {
  private let emotionManager = EmotionManager()
  init() {

  }
}

extension DiaryInteractor: DiaryBusinessLogic {

  func increaseEmotion(emotion: Emotion) {
    emotion.increase()
    try? emotionManager.save(emotion: emotion)
  }

  func fetchEmotions() {
    let emotions = emotionManager.load()
  }
}
