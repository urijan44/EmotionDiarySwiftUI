//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

public struct Emotion {
  var imageURL: String
  var title: String
  var count: Int

  public init(
    imageURL: String,
    title: String,
    count: Int) {
      self.imageURL = imageURL
      self.title = title
      self.count = count
    }
}
