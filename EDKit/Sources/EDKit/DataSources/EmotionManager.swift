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

  init() {
    print(fileSystem.defaultURL)
    mappingEmotions(emotions: load())
  }

  func save(emotion: Emotion) throws {
    emotionsUpdate(emotion: emotion)

    do {
      let emotionsArray: [Emotion] = emotions.values.map{$0}
      let encoded = try encoding(emotions: emotionsArray)
      try fileSystem.save(data: encoded)
    } catch let error {
      throw error
    }
  }

  private func mappingEmotions(emotions: [Emotion]) {
    emotions.forEach { emotion in
      self.emotions.updateValue(emotion, forKey: emotion.id)
    }
  }

  private func emotionsUpdate(emotion: Emotion) {
    emotions.updateValue(emotion, forKey: emotion.id)
  }

  private func encoding(emotions: [Emotion]) throws -> Data {

    do {
      let data = try JSONEncoder().encode(emotions)
      return data
    } catch let error {
      throw error
    }
  }

  func load() -> [Emotion] {
    if let data = try? loadData() {

      do {
        let decoded = try JSONDecoder().decode([Emotion].self, from: data)

        if decoded.isEmpty {
          mappingEmotions(emotions:  initalData())
        } else {
          let sorted = decoded.sorted { lhs, rhs in
            lhs.id < rhs.id
          }
          return sorted
        }

      } catch let error {
        fatalError(error.localizedDescription)
      }
    } else {
      mappingEmotions(emotions:  initalData())
    }
    return []
  }

  private func loadData() throws -> Data {
    do {
      let data = try fileSystem.load()
      return data
    } catch let error {
      throw error
    }
  }

  private func initalData() -> [Emotion] {
    let emotions: [Emotion] = [
      Emotion(title: "행복해"),
      Emotion(title: "즐거워"),
      Emotion(title: "좋아해"),
      Emotion(title: "화가나"),
      Emotion(title: "심심해"),
      Emotion(title: "잠이와"),
      Emotion(title: "당황해"),
      Emotion(title: "심통나"),
      Emotion(title: "눈물나")
    ].sorted { lhs, rhs in
      lhs.id < rhs.id
    }

    do {
      let data = try encoding(emotions: emotions)
      try fileSystem.save(data: data)
      return emotions
    } catch let error{
      fatalError("Error: 데이터 초기화에 실패했습니다.\n\(error)")
    }

  }
}
