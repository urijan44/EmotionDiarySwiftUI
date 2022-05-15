//
//  AppContainer.swift
//  EmotionDiary
//
//  Created by hoseung Lee on 2022/05/15.
//

import Foundation
import EDKit

struct AppContainer {
  func makeDiaryView() -> DiaryView<DiaryViewModel> {
    let interactor = DiaryInteractor()
    let presenter = DiaryPresenter()
    let viewModel = DiaryViewModel()
    interactor.presenter = presenter
    presenter.viewModel = viewModel
    viewModel.interactor = interactor
    return DiaryView(viewModel: viewModel)
  }
}
