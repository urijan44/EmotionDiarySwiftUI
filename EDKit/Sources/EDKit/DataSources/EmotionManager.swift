//
//  EmotionManager.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

protocol EmotionService {
  func save()
  func load() -> [Emotion]
}

struct EmotionManager: EmotionService {
  private var emotions: [Emotion] = []

  func save() {

  }

  func load() -> [Emotion] {
    self.emotions
  }

}
