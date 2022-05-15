//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

protocol DiaryBusinessLogic {
  func increaseEmotion(emotion: Emotion)
  func fetchEmotions()
}

final class DiaryInteractor {
  private let emotionManager = EmotionManager()
  
  init() {

  }
}

extension DiaryInteractor: DiaryBusinessLogic {

  func setEmotionTitle(title: String, emotion: Emotion) {
    emotion.setTitle(title: title)
    try? emotionManager.save(emotion: emotion)
  }

  func increaseEmotion(emotion: Emotion) {
    emotion.increase()
    try? emotionManager.save(emotion: emotion)
  }

  func fetchEmotions() {
    let emotions = emotionManager.load()
  }
}
