//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

public struct DiaryMessage {
  public struct Request {
    var emotion: Emotion
  }

  public struct Response {
    var emotions: [Emotion]
  }
}
