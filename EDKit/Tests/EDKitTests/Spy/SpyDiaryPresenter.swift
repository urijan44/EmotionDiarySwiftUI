//
//  SpyDiaryPresenter.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation
@testable import EDKit

final class SpyDiaryPresenter: DiaryPresentaitonLogic {

  var emotions: [Emotion] = []

  init() {}

  func fetchResult(response: DiaryMessage.Response) {
    emotions = response.emotions
  }

  func containsEmotion(emotion: Emotion) -> Bool {
    emotions.contains { targetEmotion in
      emotion == targetEmotion
    }
  }
}
