//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

public final class Emotion: Codable {
  private(set) var id = UUID().uuidString
  private(set) var sortIndex: Int = -1
  private(set) var imageURL: String
  private(set) var title: String
  private(set) var count: Int

  public init(title: String) {
    self.imageURL = ""
    self.title = title
    self.count = 0
  }

  public func increase() {
    count += 1
  }

  public func setTitle(title: String) {
    self.title = title
  }

  public func changeImage(urlString: String) {
    self.imageURL = urlString
  }

}

extension Emotion: Hashable {
  public static func == (lhs: Emotion, rhs: Emotion) -> Bool {
    lhs.id == rhs.id &&
    lhs.title == rhs.title
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
