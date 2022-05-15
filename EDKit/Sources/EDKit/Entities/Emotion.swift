//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

public struct Emotion {
  private(set) var imageURL: String
  private(set) var title: String
  private(set) var count: Int

  public init() {
    self.imageURL = ""
    self.title = ""
    self.count = 0
  }

  public mutating func increase() {
    count += 1
  }

  public mutating func setTitle(title: String) {
    self.title = title
  }

  public mutating func changeImage(urlString: String) {
    self.imageURL = urlString
  }

}
