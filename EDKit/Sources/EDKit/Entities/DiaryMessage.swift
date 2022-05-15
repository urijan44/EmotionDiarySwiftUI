//
//  File.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

struct DiaryMessage {
  struct Request {
    var emotion: Emotion
  }

  struct Response {
    var emotions: [Emotion]
  }
}
