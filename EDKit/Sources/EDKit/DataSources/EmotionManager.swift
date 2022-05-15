//
//  EmotionManager.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation
import FileSystem

protocol EmotionService {
  func save(emotion: Emotion) throws
  func load() throws -> [Emotion]
}

final class EmotionManager: EmotionService {
  private let fileSystem = try! FileSystem()
  private var emotions: [String: Emotion] = [:]

  func save(emotion: Emotion) throws {
    emotions.updateValue(emotion, forKey: emotion.id)
  }

  func load() -> [Emotion] {
    if let data = try? loadData(),
       let decoded = try? JSONDecoder().decode([Emotion].self, from: data) {
      return decoded
    } else {
      return []
    }
  }

  init() {
    load().forEach { emotion in
      emotions.updateValue(emotion, forKey: emotion.id)
    }
  }

  private func loadData() throws -> Data {
    do {
      let data = try fileSystem.load()
      return data
    } catch let error {
      throw error
    }
  }
}
