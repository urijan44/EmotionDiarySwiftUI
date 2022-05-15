//
//  DiaryPresenter.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

public protocol DiaryPresentaitonLogic {
  func fetchResult(response: DiaryMessage.Response)
}

final public class DiaryPresenter {
  public var viewModel: DiaryDisplayLogic?
  public init() {}
}

extension DiaryPresenter: DiaryPresentaitonLogic {
  public func fetchResult(response: DiaryMessage.Response) {
    let emotions = response.emotions
    viewModel?.updateDisplay(emotions: emotions)
  }
}
