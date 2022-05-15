//
//  DiaryPresenter.swift
//  
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation

protocol DiaryPresentaitonLogic {
  func fetchResult(response: DiaryMessage.Response)
}

final class DiaryPresenter {
  var viewModel: DiaryDisplayLogic?
  init() {}
}

extension DiaryPresenter: DiaryPresentaitonLogic {
  func fetchResult(response: DiaryMessage.Response) {
    let emotions = response.emotions
    viewModel?.updateDisplay(emotions: emotions)
  }
}
