//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

protocol DiaryBusinessLogic {
  func increaseEmotion(request: DiaryMessage.Request)
  func fetchEmotions()
}

final public class DiaryInteractor {
  private let emotionManager = EmotionManager()
  public var presenter: DiaryPresentaitonLogic?

  public init() {}
}

extension DiaryInteractor: DiaryBusinessLogic {

  func increaseEmotion(request: DiaryMessage.Request) {
    let emotion = request.emotion
    increaseEmotion(emotion: emotion)

    let editedEmotions = loadEmotion()
    let response = DiaryMessage.Response(emotions: editedEmotions)
    presenter?.fetchResult(response: response)
  }

  func fetchEmotions() {
    let emotions = loadEmotion()
    let response = DiaryMessage.Response(emotions: emotions)
    presenter?.fetchResult(response: response)
  }

  private func setEmotionTitle(title: String, emotion: Emotion) {
    emotion.setTitle(title: title)
    try? emotionManager.save(emotion: emotion)
  }

  private func increaseEmotion(emotion: Emotion) {
    emotion.increase()

    do {
      try emotionManager.save(emotion: emotion)
    } catch let error {
      print(error)
    }

  }

  private func loadEmotion() -> [Emotion] {
    emotionManager.load()
  }
}
